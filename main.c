#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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
    e_start_agendas_processing(); // Initialises the agenda processing for motors
    //////// Define-Initialise Variables \\\\\\\\\\\\\\
    
    int S_Val = 0;
    int i = 0;
    int Base_Spd = 650;
    int prx0,prx1,prx2,prx3,prx4,prx5,prx6,prx7 = 0;
    int amb0,amb1,amb2,amb3,amb4,amb5,amb6,amb7 = 0;
    int range = 200;
    char msg[100];
    int Buff;
    int ammy = 0;
    time_t t;
    srand((unsigned)time(&t));
   // e_set_front_led(1); // Turn the front LED on.  SIGNAL DEVICE ON
    // Main Loop.
    while(1)
    {
        S_Val = GetSelector();
        if (S_Val > 0){
            // Rotate clockwise
            e_set_speed_left(Base_Spd);
            e_set_speed_right(-(Base_Spd));
            Wait(2000000);
            e_set_speed_left(0);
            e_set_speed_right(0);
            while(i < S_Val){
                e_set_body_led(1);  //Turn on body LED
                Wait(500000);
                e_set_body_led(0);  //Turn off body LED  
                Wait(500000);
                i = i + 1;
            }
            i = 0;
            // Rotate anti-clockwise
            e_set_speed_left(-(Base_Spd));
            e_set_speed_right(Base_Spd);
            Wait(2000000);
            e_set_speed_left(0);
            e_set_speed_right(0);
            while(i < S_Val){
                e_set_body_led(1);  //Turn on body LED
                Wait(500000);
                e_set_body_led(0);  //Turn off body LED  
                Wait(500000);
                i++;
            }
            i=0;
        }else{
            prx0 = e_get_prox(0);
            prx1 = e_get_prox(1);
            prx2 = e_get_prox(2);
            prx3 = e_get_prox(3);
            prx4 = e_get_prox(4);
            prx5 = e_get_prox(5);
            prx6 = e_get_prox(6);
            prx7 = e_get_prox(7);
            
            //Check ambient light effects via bluetooth and develop correction
            amb0 = e_get_ambient_light(0);
            amb1 = e_get_ambient_light(1);
            amb2 = e_get_ambient_light(2);
            amb3 = e_get_ambient_light(3);
            amb4 = e_get_ambient_light(4);
            amb5 = e_get_ambient_light(5);
            amb6 = e_get_ambient_light(6);
            amb7 = e_get_ambient_light(7);
            /*
            Buff = sprintf(msg, "Ambiences in order: %d\r%d\r%d\r%d\r%d\r%d\r%d\n\n",amb0,amb1,amb2,amb3,amb4,amb5,amb6,amb7);
            e_send_uart1_char(msg,Buff);
            Wait(1000000);
            Buff = sprintf(msg, "IR in order in order: %d\r%d\r%d\r%d\r%d\r%d\r%d\n\n",prx0,prx1,prx2,prx3,prx4,prx5,prx6,prx7);
            
            e_send_uart1_char(msg,Buff);
            Wait(1000000);
             */
            // Central LED 0
            if (prx0 > range + 50 || prx7 > range + 50){
                e_set_led(0,1);
                ammy = rand() % 6;
                if (ammy < 2){
                    do{
                        e_set_speed_left((Base_Spd-75));
                        e_set_speed_right(-(Base_Spd-75));
                    }while(e_get_prox(4) < range);
                    ammy = ammy + 1;
                }else if(ammy = 2){
                    do{
                        e_set_speed_left(-(Base_Spd-75));
                        e_set_speed_right((Base_Spd-75));
                    }while(e_get_prox(3) < range);
                    ammy = 0;
                }else if(ammy < 5){
                    do{
                        e_set_speed_left(-(Base_Spd-75));
                        e_set_speed_right((Base_Spd-75));
                    }while(e_get_prox(6) > 50);
                }else if(ammy = 5){
                    do{
                        e_set_speed_left((Base_Spd-75));
                        e_set_speed_right(-(Base_Spd-75));
                    }while(e_get_prox(1) > 50);
                }else{
                    while(TRUE){
                    e_set_led(0,0);
                    e_set_speed_left(0);
                    e_set_speed_right(0);
                    Wait(500000);
                    e_set_led(0,1);
                    Wait(500000);
                    }
                }
            }else if( prx2 > range*2){
                e_set_led(2,1);
                do{
                        e_set_speed_left(-Base_Spd);
                        e_set_speed_right(Base_Spd);
                    }while(e_get_prox(3) < range);
            }else if(prx5 > range*2){
                e_set_led(6,1);
                do{
                        e_set_speed_left(Base_Spd);
                        e_set_speed_right(-Base_Spd);
                    }while(e_get_prox(4) < range);
            }else{
                e_set_led(0,0);
                e_set_led(2,0);
                e_set_led(6,0);
                e_set_speed_left(Base_Spd - 25);
                e_set_speed_right(Base_Spd + 25);
            }
            
            //LED 1
            if (prx1 > range){
                e_set_led(1,1);
            }else{
                e_set_led(1,0);
            }
            //LED 2 (3 o'clock)
            if (prx2 > range){
                e_set_led(2,1);
            }else{
                e_set_led(2,0);
            }
            //LED 3
            if (prx3 > range){
                e_set_led(3,1);
            }else{
                e_set_led(3,0);
            }
            // Central LED 4
            if (prx3 > range/2 && prx5 > range/2){
                e_set_led(4,1);
            }else{
                e_set_led(4,0);
            }
            //LED 5
            if (prx4 > range){
                e_set_led(5,1);
            }else{
                e_set_led(5,0);
            }
            //LED 6 (9 o'clock)
            if (prx5 > range){
                e_set_led(5,1);
            }else{
                e_set_led(5,0);
            }
            //LED 7
            if (prx6 > range){
                e_set_led(6,1);
            }else{
                e_set_led(6,0);
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
