class Timer
  attr_accessor :timer, :timer_cb
  def self.make(interval, &b)
    timer = new
    obj = NSTimer.scheduledTimerWithTimeInterval(interval, target:timer, selector:'_timerFired', userInfo:nil, repeats:true)
    timer.timer = obj
    timer.timer_cb = b
    timer
  end

  def invalidate
    @timer.invalidate
  end

  def _timerFired
    @timer_cb.call
  end
end
