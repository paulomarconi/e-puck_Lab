/*
 * University of Sheffield 
 * ACS6121 - ACS6121 Robotics and Autonomous Systems
 * E-puck lab assessment 
 * 20/03/2019
 * Group 3.4
 *  - Rosca Rares
 *  - Loma Marconi Paulo Roberto
 *  - Garcia Serrano Guillermo
 *  - Yu Jiapeng
 * 
 * Task 1() - Graded:
 *  - Explore the environment;
 *  - Avoid any collision with the environment
 * 
 * Task 2() - Graded:
 *  - Chase an object in an environment free of obstacles
 *  - Avoid any collision with the object.
 * 
 * Proximity_blink2() - Graded:
 *  - Send the proximity sensors values through Bluetooth
 *  - Turn on the corresponding Led of the proximity sensors when they detect
 *    obstacle less than 200
 * 
 * Rebound_avoider() - Not Graded;
 *  - Alternative implementation of Avoider/Follower Rebound Algorithm
 *  - Ref. 10.1109/ICCA.2010.5524302
 */

#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h> // motor ports
#include <motor_led/e_init_port.h> // motor init
#include <a_d/advance_ad_scan/e_prox.h> // sensors
#include <a_d/advance_ad_scan/e_ad_conv.h> // analog digital conv
#include <uart/e_uart_char.h> // bluetooth
#include <stdio.h>
#include <math.h>


// functions
void Wait(long);
int GetSelector(void);

void proximity_blink2();
void Task1();
void Task2();
void Rebound_avoider();

// -----------------------------------------------------------------------------

// Task1 variables
int N=6; // number of sensors used in the Task1
double a[4] = { 0, 1, 2, 5, 6, 7}; // selected sensors

// Task2 variables
int right[3] = {1, 2, 3}; // Right-hand side sensors
int left[3] = {4, 5, 6}; // Left-hand side sensors
int min = 200, max = 500; // Minimum and maximum threshold for detection

// Proximity_blink2 variables
char buffer[100]; // used to send data through Bluetooth 


// -----------------------------------------------------------------------------
// Rebound_avoider variables

// Choose robot behaviour 
unsigned int behaviour=0; // 0=avoider, 1=follower

// global constants
#define T   500000  //200000us=200ms, sample period [us]
#define pi  3.1415926536    	

// Bubble Rebound algorithm 
#define N   6  // number of sensors used in the algorithm
int alpha0=0.5235987756;   //pi/N;

//int alpha[8] = {-1*alpha0,-2*alpha0,-3*alpha0,0,0,3*alpha0,2*alpha0,1*alpha0}; // avoider
int alpha[8] = {-0.5235987756,-1.04711975512,-1.5707963268,0,0,1.5707963268,1.04711975512,0.5235987756}; // avoider

//int alpha[8] = {1*alpha0,2*alpha0,3*alpha0,0,0,-3*alpha0,-2*alpha0,-1*alpha0}; // follower
int alphaR=0;   //[rad]

int sum_alphaD=0;
int sumD=0;

// e-puck constants

//int motor_speed = 394; // 5 [cm/s] * 78.74 [steps/s]/[cm/s] = 394 [steps/s]
int maxWheelVel=1000; //[steps/s] Max angular wheel speed 6.24[rad/s]
int maxLinearVelRobot=0.127; // Max robot linear velocity, 0.127[m/s]=12.7[cm/s]
#define L   0.051   // 5.1 cm, distance between the wheels
#define D   0.041   // 4.1 cm, wheel diameter
#define R   0.0205  // R=D/2, wheel radius

int linearVelRobot=0;
int omega=0;
int velLeft=0;
int velRight=0;

// sensor values
int proxSensDist[8]={0,0,0,0,0,0,0,0};
int threshold=200; //





//==============================================================================
void main()
{
    // Initialisation. 
    e_init_port(); // Init the ports.
    e_init_ad_scan(ALL_ADC); // Init the analogue to digital converters.
    e_led_clear(); // Turn off all the LEDs in the initialisation stage.
    e_init_uart1(); // Init the UART, Bluetooth comm
    e_calibrate_ir(); // when you use Proximity Sensors.
    e_init_motors(); // Init the motors. Uncomment when you use the motors.
    e_start_agendas_processing(); // Allows the robot to execute multiple tasks.
    								
	e_led_clear();
	e_set_body_led(0);
	e_set_front_led(0);

	e_activate_agenda(proximity_blink2, 500);
    
    // Main Loop.
    while(1)
    {         
        int selector = GetSelector();
        if(selector == 0) // idle mode
        { 
            e_set_speed_left(0); 
            e_set_speed_right(0);
        }
        else if (selector == 1)
            Task1();
        else if (selector == 2)
            Task2();
        else if (selector == 3)
            Rebound_avoider();
        
    }
    return 0;
}
//==============================================================================

void Wait(long Duration) 
{
    long i;
    for(i=0;i<Duration;i++);
}

int GetSelector() 
{
    return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}



void Task1()
{
    e_set_speed_left(750); 
    e_set_speed_right(800);
    int i;
    for (i = 0; i<N; i++)
    {
        if ( (e_get_prox(a[i])>200 ) && ((i == 0 ) || (i == 1) || (i == 2) ) ) 
        {    
            while(e_get_prox(a[i]) > 200)
            {
               e_set_speed_left(-500); 
               e_set_speed_right(500);
            }
        }
        if ( (e_get_prox(a[i])>200 ) && ((i == 6 ) || (i == 7) || (i == 2) ) ) 
        {    
            while(e_get_prox(a[i]) > 200)
            {
                e_set_speed_left(500);
                e_set_speed_right(-500);
            }
        }
    }

}



void Task2()
{     
    if( (e_get_prox(0) > min-50) && (e_get_prox(7) > min-50) && (e_get_prox(0) < max) && (e_get_prox(7) < max))
    {
        e_set_speed_left(800);
        e_set_speed_right(800);
    }
    else if (e_get_prox(1) > min)
    {
        e_set_speed_left(800);
        e_set_speed_right(-800);
    }
    else if (e_get_prox(2) > min)
    {
        e_set_speed_left(800);
        e_set_speed_right(-800);
    }
    else if (e_get_prox(3) > min)
    {
        e_set_speed_left(800);
        e_set_speed_right(-800);
    }
    else if (e_get_prox(6) > min)
    {
        e_set_speed_left(-800);
        e_set_speed_right(800);
    }
    else if (e_get_prox(5) > min)
    {
        e_set_speed_left(-800);
        e_set_speed_right(800);
    }
    else if (e_get_prox(4) > min)
    {
        e_set_speed_left(-800);
        e_set_speed_right(800);
    }
    else if ((e_get_prox(0) > max+30) && (e_get_prox(7) > max+30))
    {
        e_set_speed_left(-800);
        e_set_speed_right(-800);
    }
    else
    {
        e_set_speed_left(0);
        e_set_speed_right(0); 
    }

}




void proximity_blink2()
{
    int i;
    for(i = 0; i<=7; i++)
    {
        if(e_get_prox(i) > 200)
        {
            e_set_led(i, 1);
        }
        else
        {
            e_set_led(i, 0);
        }
    }

    // send proximity values via bluetooth
    sprintf(buffer, "IR0=%d,IR1=%d,IR2=%d,IR3=%d,IR4=%d,IR5=%d,IR6=%d,IR7=%d\n\r\0",
    e_get_prox(0), e_get_prox(1), e_get_prox(2), e_get_prox(3), e_get_prox(4),
    e_get_prox(5), e_get_prox(6), e_get_prox(7));
    e_send_uart1_char(buffer, strlen(buffer));
    while (e_uart1_sending());
}






void Rebound_avoider()
{
    // read sensor values
    int i;
    for (i=0; i < 8; i++){
        proxSensDist[i]=e_get_prox(i);
    }
    
    // Rebound algorithm
    sum_alphaD=0;
    sumD=0;
    for (i=0; i < 8; i++){
        sum_alphaD=sum_alphaD+alpha[i]*proxSensDist[i];
    }   
    for (i=0; i < 8; i++){
        sumD=sumD+proxSensDist[i];
    }   
    
    if (sumD==0) sumD=0.0000000000001;
    alphaR=sum_alphaD/sumD;
    
    // Control output
    threshold=200;
    if (behaviour==0){ // -- avoider
        linearVelRobot=maxLinearVelRobot*0.5; // go straight
        if ( (proxSensDist[0]<threshold) || (proxSensDist[7]<threshold) ){  // front sensors       
            linearVelRobot=0; // stop robot
            alphaR=pi*0.1; // max_alphaR=pi, rebound angle. alphaR>pi*n, n=[0,1]
        }    
    }
    

    if (behaviour==1){ // follower
        linearVelRobot=maxLinearVelRobot*0.5; // go straight
        if ( (proxSensDist[7]<threshold) || (proxSensDist[0]<threshold) ){ // front sensors       
            linearVelRobot=0; // stop robot
            alphaR=0;
            if ( (proxSensDist[6]<threshold) || (proxSensDist[7]<threshold) || (proxSensDist[0]<threshold) || (proxSensDist[1]<threshold) ){ 
                linearVelRobot=-maxLinearVelRobot*0.1;               
            }
        }
    }
    
    // omega = robot angular velocity [rad/s] (pi[rad]=180[deg]), 
    // max_omega=pi[rad/s], T[ms]/1000[ms] = t[s], 
    omega=alphaR/(T/1000000); // instantaneous angular velocity
    //omega=alphaR;
            

    // Angular velocities of the wheels using the Unicycle model
    //velLeft=(2*linearVelRobot+omega*L)/(2*R); // rad/s
    //velRight=(2*linearVelRobot-omega*L)/(2*R); // rad/s
    velLeft=( (2*linearVelRobot+omega*L)/D )/0.00624; // rad/s
    velRight=( (2*linearVelRobot-omega*L)/D )/0.00624; // rad/s


    // Wheel velocities constraints
    if (velLeft>maxWheelVel) velLeft=maxWheelVel;
    else if (velLeft<-maxWheelVel) velLeft=-maxWheelVel;       
    
    if (velRight>maxWheelVel) velRight=maxWheelVel;
    else if (velRight<-maxWheelVel) velRight=-maxWheelVel;    
    
    
    e_set_speed_left(velLeft); 
    e_set_speed_right(velRight);
    
       
    Wait(T); 
}
