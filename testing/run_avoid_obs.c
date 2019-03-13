/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <math.h>

#define PROXSENSORFACTOR 5
// IT WAS 4 BEFORE
#define MINSPEED 600
// IT WAS 550
#define MAXVELOCITY 1000
#define NUMSENSORS 8

int i, j;

long cumulative[2];

int wheelSpeed[2];
// target velocity as a percentage of max velocity;
// TO DO: use
int targetVelocity = 0.9;

// calibrate these values!! 
int baseVelocity = 3; // was 2
int multiplier = 2;

//int forwardSpeedWeight[4] = {baseVelocity*multiplier*2,baseVelocity*multiplier,baseVelocity,0};
int forwardSpeedWeight[NUMSENSORS/2];
int backwardSpeedWeight[NUMSENSORS/2];

void initVectors(int *forwardV,int *backwardV,int baseVelocity, int multiplier){
    int scaler;
    for(i = NUMSENSORS/2 - 1; i >= 0; i--){
        if ( i == NUMSENSORS/2-1) 
            scaler = 0;
        else
            scaler = pow(multiplier,NUMSENSORS/2-2-i);
        forwardV[i] = baseVelocity * scaler;
        backwardV[i] = -multiplier*forwardV[i];
    }
}

// function used to set the min and max values of the velocity
int setMinMax(int limit, int targetSpeed){
	if (targetSpeed > limit)
		return limit;
	else if (targetSpeed < -limit)
		return -limit;
	else
		return targetSpeed;
}

int e_get_calibrated_prox(int j){
    if (j == 0) return(20);
    else if(j == 1) return(80);
    else if(j == 2) return(200);
    else if(j == 3) return(400);
    else if(j == 4) return(800);
    else if(j == 5) return(2000);
    else return(4000);
}
void avoid_obst(){
	for (i = 0; i < 2; i++)
	{
		cumulative[i] = 0;
		for (j = 0; j < 4; j++){
			if( i == 0){
				cumulative[i] += forwardSpeedWeight[j] * e_get_calibrated_prox(j);
				cumulative[i] += backwardSpeedWeight[NUMSENSORS/2 - j] * e_get_calibrated_prox(NUMSENSORS - j);
			} else if( i == 1 ){
				cumulative[i] += backwardSpeedWeight[j] * e_get_calibrated_prox(j);
				cumulative[i] += forwardSpeedWeight[NUMSENSORS/2 - j] * e_get_calibrated_prox(NUMSENSORS - j);
			}
		}
		
		// wheel speed proportional to cumulative sum of sensor reading + some min speed. Sign is adjusted.
		// perhaps too big.
		if (cumulative[i] >= 0)
			wheelSpeed[i] = cumulative[i]/PROXSENSORFACTOR + MINSPEED;
		else
			wheelSpeed[i] = cumulative[i]/PROXSENSORFACTOR + MINSPEED*(-1);
		
		// wheel speed within min and max
		// replace MAXVELOCITY by limit from bluetooth in future version
		wheelSpeed[i] = setMinMax(MAXVELOCITY, wheelSpeed[i]);

    printf("\ni = %d: %d\n",i,wheelSpeed[i]);
	}
}
	

// main function to initialise and call avoid_obstacle function
void run_avoid_obs(void)
{	
    initVectors(&forwardSpeedWeight, &backwardSpeedWeight, baseVelocity, multiplier);

printf("\nValues vector 1:\n");
    for(i = 0; i < NUMSENSORS/2; i++){
        
        printf("%d\t",forwardSpeedWeight[i]);
    }
    
    printf("\nValues vector 2:\n");
    for(i = 0; i < NUMSENSORS/2; i++){
        
        printf("%d\t",backwardSpeedWeight[i]);
    }

	avoid_obst();

}

int main()
{
    run_avoid_obs();
    return 0;
}