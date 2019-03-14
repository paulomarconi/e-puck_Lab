#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <stdio.h>
#include <math.h>
#define pi 3.14159265358979323846

void Wait(long);
int GetSelector(void);

int main()
{
    // Initialisation. 
    e_init_port(); // Initialises the ports.
    e_init_ad_scan(ALL_ADC); // Initialises the analogue to digital converters.
    e_led_clear(); // Turn off all the LEDs in the initialisation stage.
    e_start_agendas_processing(); // Allows the robot to execute multiple tasks.
    
     e_init_uart1(); // Initialises the UART. Uncomment when you use Bluetooth communication.
     e_calibrate_ir(); // Uncomment when you use Proximity Sensors.
     e_init_motors(); // Initialises the motors. Uncomment when you use the motors.

    // Main Loop.
     int right[3] = {1, 2, 3}; // Right-hand side sensors
     int left[3] = {4, 5, 6}; // Left-hand side sensors
     int min = 200, max = 400; // Minimum and maximum threshold for detection
     
     while(1)
     {
         int i;
         double sum_big=0, sum_small=0;
         for (i = 0; i<3; i++)
         {
             if(e_get_prox(right[i]) > min ) // If one of the sensors on the right-hand side is activated, spin right until orientation adjusted
                 while((e_get_prox(0) < min) && (e_get_prox(7) < min))
                 {
                     e_set_speed_left(400);
                     e_set_speed_right(-400);
                 }
             if(e_get_prox(left[i]) > min) // If one of the sensors on the left-hand side is activated, spin left until orientation adjusted
                 while((e_get_prox(0) < min) && (e_get_prox(7) < min))
                 {
                     e_set_speed_left(-400);
                     e_set_speed_right(400);
                 }
             if((e_get_prox(7) > min) && (e_get_prox(0) > min)) // If front sensors exceed min threshold move forward until they exceed max threshold
                 while ((e_get_prox(7) < max) && (e_get_prox(0) < max ) && (e_get_prox(7) > min) && (e_get_prox(0) > min)) 
                 {
                     e_set_speed_left(700);
                     e_set_speed_right(700);
                 }
       
         }   
         
         
     }
    return 0;
}

/*
int main()
{
    // Initialisation. 
    e_init_port(); // Initialises the ports.
    e_init_ad_scan(ALL_ADC); // Initialises the analogue to digital converters.
    e_led_clear(); // Turn off all the LEDs in the initialisation stage.
    e_start_agendas_processing(); // Allows the robot to execute multiple tasks.
    
     e_init_uart1(); // Initialises the UART. Uncomment when you use Bluetooth communication.
     e_calibrate_ir(); // Uncomment when you use Proximity Sensors.
     e_init_motors(); // Initialises the motors. Uncomment when you use the motors.

    // Main Loop.
     int N=6;
     int sensor_readings[N];
     int i;
     double a[4] = { 0, 1, 6, 7};
     while(1)
     {
         e_set_speed_left(750); 
         e_set_speed_right(800);
         for (i = 0; i<4; i++)
         {
             if ( (e_get_prox(a[i])>200 ) && ((i == 0 ) || (i == 1)) ) 
                 while(e_get_prox(a[i]) > 200)
                 {
                    e_set_speed_left(-500); 
                    e_set_speed_right(500);
                 }
             if ( (e_get_prox(a[i])>200 ) && ((i == 6 ) || (i == 7)) ) 
                 while(e_get_prox(a[i]) > 200)
                 {
                     e_set_speed_left(500);
                     e_set_speed_right(-500);
                 }
             

         }
     }
}
*/

void Wait(long Duration) 
{
    long i;
    for(i=0;i<Duration;i++);
}

int GetSelector() {
    return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}
