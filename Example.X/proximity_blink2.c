#include <p30F6014A.h>
#include <motor_led/e_epuck_ports.h>
#include <motor_led/e_init_port.h>
#include <a_d/advance_ad_scan/e_prox.h>
#include <a_d/advance_ad_scan/e_ad_conv.h>
#include <uart/e_uart_char.h>
#include <string.h>
#include <stdio.h>




void proximity_blink2(){
    int i;
    char buffer[100];
    
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