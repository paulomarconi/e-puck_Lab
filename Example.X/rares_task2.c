#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <stdio.h>
#include <math.h>
#define pi 3.14159265358979323846

void rares_task2()
{

    int right[3] = {1, 2, 3}; // Right-hand side sensors
    int left[3] = {4, 5, 6}; // Left-hand side sensors
    int min = 200, max = 500; // Minimum and maximum threshold for detection
     
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


