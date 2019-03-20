#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h> // motor ports
#include <motor_led/e_init_port.h> // motor init
#include <a_d/advance_ad_scan/e_prox.h> // sensors
#include <a_d/advance_ad_scan/e_ad_conv.h> // analog digital conv
#include <uart/e_uart_char.h> // bluetooth
#include <stdio.h>
#include <math.h>

// libraries for Task 1 and Task 2
#include "run_avoid_obs.h"
#include "rares_task1.h";
#include "rares_task2.h";
#include "run_rebound_avoider.h"
#//include "run_rebound_follower.h"
#include "yu_Task2.h"


// functions
void Wait(long);
int GetSelector(void);


void test();



//==============================================================================
int main()
{
    // Initialisation. 
    e_init_port(); // Init the ports.
    e_init_ad_scan(ALL_ADC); // Init the analogue to digital converters.
    e_led_clear(); // Turn off all the LEDs in the initialisation stage.
    e_init_uart1(); // Init the UART, Bluetooth comm
    e_calibrate_ir(); // when you use Proximity Sensors.
    e_init_motors(); // Init the motors. Uncomment when you use the motors.
    e_start_agendas_processing(); // Allows the robot to execute multiple tasks.
    

    
    // Main Loop.
    while(1)
    {         
        int selector = GetSelector();
        if(selector == 0){ // idle mode
            e_set_speed_left(0); 
            e_set_speed_right(0);
        }
        else if (selector == 1)
            run_avoid_obs(); 
        else if (selector == 2)
            rares_task1();
        else if (selector == 3)
            rares_task2();
        else if (selector == 4)
            yu_Task2(); 
        else if (selector == 5)
            run_rebound_avoider(); 
        //else if (selector == 6)
        //    run_rebound_follower(); 
        
        
      
        
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





void test()
{
    int motor_speed = 394; // 5 [cm/s] * 78.74 [steps/s]/[cm/s] = 394
    int selector = GetSelector();
    if(selector > 0)
    {   
        int i;
        for(i=0;i<selector;i++)
        {
            //e_set_front_led(1); // Turn the front red LED on. 
            //e_set_led(8,1); // Turn all the ring LEDs on.      
            e_set_body_led(1); // Turn on body green LED
            Wait(500000); // 500000us=500 ms delay
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








/*
void test2()
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

*/