/*
 * File:   run_rebound_task1.c
 * Author: Paulo Loma
 *
 * Created on March 15, 2019, 9:17 PM
 */


//#include <stdio.h>
#include "run_rebound_avoider.h"
#include <p30F6014A.h>
#include "motor_led/e_init_port.h" // motor init
#include "a_d/advance_ad_scan/e_prox.h" // proximity sensors init
#include "uart/e_uart_char.h" // bluetooth comm.
#include <motor_led/e_epuck_ports.h> // motor ports init
#include "a_d/advance_ad_scan/e_ad_conv.h" // analog digital conv

//#include <codec/e_sound.h>
#include <stdio.h> // standard io
#include <math.h>





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
//int proxSensDist[8]={0,0,0,0,0,0,0,0};
int proxSensDist[8]={220,220,0,0,0,0,0,0};

int threshold=200; //


void run_rebound_avoider(){
    // read sensor values
    unsigned int i;
    //for (i=0; i < 8; i++){
    //    proxSensDist[i]=e_get_prox(i);
    //}
    
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
