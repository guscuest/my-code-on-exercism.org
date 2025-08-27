static class LogLine
{
    public static string Message(string logLine) => logLine.Substring(logLine.IndexOf(":")+2).Trim();
    
    public static string LogLevel(string logLine) => logLine.Substring(1, logLine.IndexOf(":")-2).Trim().ToLower();

    public static string Reformat(string logLine) => $"{Message(logLine)} ({LogLevel(logLine)})";  }
