
#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <stdio.h>

#include "run_avoid_obs.h"


int prx0; int prx7;

void Wait(long);
int GetSelector(void);

void Task1();
void Task2();
void Task3();
void modeSelector();
//==============================================================================
int main()
{
    // Initialisation. 
    e_init_port(); // Initialises the ports.
    e_init_ad_scan(ALL_ADC); // Initialises the analogue to digital converters.
    e_led_clear(); // Turn off all the LEDs in the initialisation stage.
    // e_init_uart1(); // Initialises the UART. Uncomment when you use Bluetooth communication.
    // e_calibrate_ir(); // Uncomment when you use Proximity Sensors.
    e_init_motors(); // Initialises the motors. Uncomment when you use the motors.
    
    e_start_agendas_processing(); // Allows the robot to execute multiple tasks.
    
   
    prx0 = e_get_prox(0);
    prx7 = e_get_prox(7);  
    e_set_speed_left(500);
    e_set_speed_right(500);

    
    // Main Loop.
    while(1)
    {
        //e_set_front_led(1); // Turn the front red LED on. 
        //e_set_led(8,1); // Turn all the ring LEDs on.       
        modeSelector();
        
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
    e_set_body_led(1); // Turn on body green LED
    Wait(1000000); // 1000000 us = 1 s delay
    e_set_body_led(0); // Turn off body green LED
    Wait(1000000); 
}

void Task2()
{
    int motor_speed = 394; // 5 [cm/s] * 78.74 [steps/s]/[cm/s] = 394
    int selector = GetSelector();
    if(selector > 0)
    {   
        int i;
        for(i=0;i<selector;i++)
        {
            e_set_body_led(1); // Turn on body green LED
            Wait(500000); // 500 ms
            e_set_body_led(0);    
            Wait(500000); // 500 ms
        }
        /* motor_speed from -1000 to 1000 give the motor speed in steps/s,
        positive value to go forward and negative to go backward.*/
        e_set_speed_left(motor_speed); 
        e_set_speed_right(motor_speed);
    }
    else // stop
    {
        e_set_speed_left(0); 
        e_set_speed_right(0);
    }
}

void modeSelector(){
    int selector = GetSelector();
    
    if(selector == 0)
        run_avoid_obs();
    else if (selector == 1)
        Task1();
    else if ( selector == 2)
        Task2();
    else if ( selector == 3)
        Task3();
    // guys add your code here and we can test multiple algorithms with every compilation.
    else
        run_avoid_obs();
    
}
void Task3()
{    
    if(prx0 > 800)
    {
       e_set_speed_left(0);
       e_set_speed_right(0);
       Wait(10000);
       if(prx7>=prx0)
       {
            e_set_speed_left(0);e_set_speed_right(0);Wait(10000);
            do {e_set_speed_left(100);e_set_speed_right(-100);}
            while(prx7==0&&prx0==0);
            Wait(20000);
       }
       else
       {
            e_set_speed_left(0);e_set_speed_right(0);Wait(10000);
            do {e_set_speed_left(-100);e_set_speed_right(100);}
            while(prx7==0&&prx0==0);
            Wait(10000);
       }

    }    
}

