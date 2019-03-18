#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <stdio.h>

void Wait(long);
int GetSelector(void);
int prx0,prx1,prx2,prx3,prx4,prx5,prx6,prx7,prx_temp;

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
   while(1)
    {
     prx0 = e_get_prox(0);
     prx1 = e_get_prox(1);
     prx2 = e_get_prox(2);
     prx3 = e_get_prox(3);
     prx4 = e_get_prox(4);
     prx5 = e_get_prox(5);
     prx6 = e_get_prox(6);
     prx7 = e_get_prox(7);   
     do {e_set_speed_left(-600);e_set_speed_right(600);}
     while(prx0<200&&prx7<200);
	 e_set_speed_left(0);
	 e_set_speed_right(0);
     
     int prx_temp=e_get_prox(0);
     if(prx_temp > prx0)
     {
         if(prx0>prx7)
         {
             e_set_speed_left(600);e_set_speed_right(-600);
             while(prx0<=prx7)
             {
                 e_set_speed_left(0);e_set_speed_right(0);
             }
         }
      
         else if(prx0<=prx7)
         {
             e_set_speed_left(-600);e_set_speed_right(600);
             while(prx0>prx7)
             {
                 e_set_speed_left(-500);e_set_speed_right(-500);
                 while(prx0<prx_temp);{e_set_speed_left(0);e_set_speed_right(0);}
             }
         }
     }
     else
     {
         if(prx0>prx7)
         {
             e_set_speed_left(600);e_set_speed_right(-600);
             while(prx0<=prx7)
             {
                 e_set_speed_left(0);e_set_speed_right(0);
             }
         }
      
         else if(prx0<=prx7)
         {
             e_set_speed_left(-600);e_set_speed_right(600);
             while(prx0>prx7)
             {
                 e_set_speed_left(500);e_set_speed_right(500);
                 while(prx0>prx_temp);{e_set_speed_left(0);e_set_speed_right(0);}
             } 
          }
}   
}
    return 0;
}
void Wait(long Duration) 
{
    long i;
    for(i=0;i<Duration;i++);
}

int GetSelector() {
    return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}
