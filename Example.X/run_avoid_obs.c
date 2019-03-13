#include <p30F6014A.h>
#include "motor_led/e_init_port.h" // motor init
#include "a_d/advance_ad_scan/e_prox.h" // proximity sensors init
#include "uart/e_uart_char.h" // bluetooth comm.
#include <motor_led/e_epuck_ports.h> // motor ports init
#include "a_d/advance_ad_scan/e_ad_conv.h" // analog digital conv

#include <stdio.h> // standard io
#include <math.h>


/* #include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "motor_led/advance_one_timer/e_agenda.h"
 */

#define PROXSENSORFACTOR 5
// IT WAS 4 BEFORE
#define MINSPEED 600
// IT WAS 550
#define MAXVELOCITY 1000
#define NUMSENSORS 8

int i, j;

long cumulative;

int wheelSpeed[2];
// target velocity as a percentage of max velocity;
// TO DO: use
int targetVelocity = 0.9;

// calibrate these values!! 
int baseVelocity = 3; // was 2
int multiplier = 2;

//int forwardSpeedWeight[4] = {baseVelocity*multiplier*2,baseVelocity*multiplier,baseVelocity,0};
int forwardSpeedWeight[NUMSENSORS/2];
int scaler;
for (i = 0; i < NUMSENSORS/2; i++){
	if ( i == 0) 
		scaler = 1;
	else
		scaler = pow(multiplier,i-1);
	
	forwardSpeedWeight[NUMSENSORS/2 - i] = baseVelocity * scaler;
}

int backwardSpeedWeight[NUMSENSORS/2] = -multiplier*forwardSpeedWeight;

// function used to set the min and max values of the velocity
int setMinMax(int limit, int targetSpeed){
	if (targetSpeed > limit)
		return limit;
	else if (targetSpeed < -limit)
		return -limit;
	else
		return targetSpeed;
}

// function used to set the speed of each wheel in the loop.
void setWheelSpeeds(int side, int speed){
	if(side == 0)
		e_set_speed_right(speed);
	else
		e_set_speed_left(speed);
}


// use e_get_calibrated_prox or e_get_prox???
				/* int e_get_calibrated_prox (unsigned int sensor_number)
				To get the calibrated value of the ir sensor.
				• int e_get_prox (unsigned int sensor_number)
				To get the analogic proxy sensor value of a specific ir sensor
				*/

// to do, add targetSpeed as argument, use from bluetooth
	// void avoid_obst(int targetSpeed){
void avoid_obst(){
	for (i = 0; i < 2; i++)
	{
		cumulative[i] = 0;
		for (j = 0; j < 4; j++){
			if( i == 0){
				cumulative[i] += forwardSpeedWeight[j] * e_get_calibrated_prox(j);
				cumulative[i] += backwardSpeedWeight[NUMSENSORS/2 - j] * e_get_calibrated_prox(NUMSENSORS - j);
			} else if( i == 1 ){
				cumulative[i] += backwardSpeedWeight[j] * e_get_calibrated_prox(j);
				cumulative[i] += forwardSpeedWeight[NUMSENSORS/2 - j] * e_get_calibrated_prox(NUMSENSORS - j);
			}
		}
		
		// wheel speed proportional to cumulative sum of sensor reading + some min speed. Sign is adjusted.
		// perhaps too big.
		if (cumulative[i] >= 0)
			wheelSpeed[i] = cumulative[i]/PROXSENSORFACTOR + MINSPEED;
		else
			wheelSpeed[i] = cumulative[i]/PROXSENSORFACTOR + MINSPEED*(-1);
		
		// wheel speed within min and max
		// replace MAXVELOCITY by limit from bluetooth in future version
		wheelSpeed[i] = setMinMax(MAXVELOCITY, wheelSpeed[i]);
		// set left and right wheel speed, function will call specific function
		setWheelSpeeds(i, wheelSpeed[i]);
	}
}
	

// main function to initialise and call avoid_obstacle function
void run_avoid_obs(void)
{	
	e_init_port();
	e_init_ad_scan(ALL_ADC);
	e_init_sound();
	e_calibrate_ir();

	e_activate_agenda(avoid_obst, 500);
	// call function that use leds to show what the robot is "seeing"
	e_init_motors();
	e_start_agendas_processing();
	
	// testing of wouaaaah
	e_play_sound(11028, 8016);
	for (long i = 0; i< 8016;i++);

	while(1){
		// main loop
	}
}
