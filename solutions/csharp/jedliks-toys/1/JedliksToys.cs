class RemoteControlCar
{
    public static RemoteControlCar Buy() => new RemoteControlCar();
    
    private int _meters;
    private int _battery = 100;    
    
    public string DistanceDisplay() => $"Driven {_meters} meters";

    public string BatteryDisplay() 
    {
        if (_battery > 0) 
        {
            return $"Battery at {_battery}%";
        } 
        
        else 
        {
            return  $"Battery empty";
        }        
    } 

    public void Drive()
    {
        if (_battery > 0)
        {
            _meters += 20;
            _battery -= 1;
        }        
    }
}
