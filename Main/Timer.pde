public class CountDown
{
  int durationSeconds;

  public CountDown(int duration)
  {
    this.durationSeconds = duration;
  }

  public int getRemainingTime()
  {
    return max(0, durationSeconds - millis()/1000);
  }
}
