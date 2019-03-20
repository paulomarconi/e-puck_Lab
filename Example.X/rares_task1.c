#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <stdio.h>
#include <math.h>
#define pi 3.14159265358979323846


void rares_task1(){
    int N=6;
    int sensor_readings[N];
    int i;
    double a[4] = { 0, 1, 2, 5, 6, 7};

    e_set_speed_left(750); 
    e_set_speed_right(800);
    for (i = 0; i<6; i++)
    {
        if ( (e_get_prox(a[i])>200 ) && ((i == 0 ) || (i == 1) || (i == 2) ) ) 
            while(e_get_prox(a[i]) > 200)
            {
               e_set_speed_left(-500); 
               e_set_speed_right(500);
            }
        if ( (e_get_prox(a[i])>200 ) && ((i == 6 ) || (i == 7) || (i == 2) ) ) 
            while(e_get_prox(a[i]) > 200)
            {
                e_set_speed_left(500);
                e_set_speed_right(-500);
            }


    }

}

