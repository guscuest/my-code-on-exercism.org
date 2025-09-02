class BirdCount
{
    private int[] birdsPerDay;
    int today;
    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }
    public static int[] LastWeek() => [0, 2, 5, 3, 7, 8, 4];
    public int Today() => birdsPerDay[birdsPerDay.Length - 1];                
    public void IncrementTodaysCount()
    {
        birdsPerDay[birdsPerDay.Length - 1] ++;
    }
    public bool HasDayWithoutBirds() 
    {
        bool zero = false;
        foreach (int birds in birdsPerDay) 
        {
        zero = zero || birds == 0;   
        } 
        return zero;
    }
    public int CountForFirstDays(int numberOfDays)
    {
        int sum = 0;        
        for (int i=0; i<numberOfDays; i++)
        {
            sum += birdsPerDay[i];
        }
        return sum;
    }
    public int BusyDays()
    {
        int count = 0;
        foreach (int birds in birdsPerDay)
        {
            if (birds >= 5) 
            {
                count++;
            } 
        }
        return count;
    }
}
