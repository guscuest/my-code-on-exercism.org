class Lasagna
{
    public int EXPECTED_TIME = 40;
    public int TIME_EACH_LAYER = 2;
    
    // TODO: define the 'ExpectedMinutesInOven()' method
    public int ExpectedMinutesInOven() => EXPECTED_TIME;    

    // TODO: define the 'RemainingMinutesInOven()' method
    public int RemainingMinutesInOven(int time) {
        return EXPECTED_TIME - time;
    }

    // TODO: define the 'PreparationTimeInMinutes()' method
    public int PreparationTimeInMinutes(int layers) {
        return layers * TIME_EACH_LAYER;
    }

    // TODO: define the 'ElapsedTimeInMinutes()' method
    public int ElapsedTimeInMinutes(int layers, int time) {
        return time + layers * TIME_EACH_LAYER;
    }
}

