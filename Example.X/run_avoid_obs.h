#ifndef RUN_AVOID_OBS
#define RUN_AVOID_OBS

void initVectors(int* forwardV,int* backwardV,int baseVelocity, int multiplier);
int setMinMax(int limit, int targetSpeed);
void setWheelSpeeds(int side, int speed);
void avoid_obst();
void run_avoid_obs();

#endif