class Timer < Java::Util::TimerTask
  attr_accessor :obj, :handler, :on_timer
  def self.make(interval, &b)
    obj = Java::Util::Timer.new
    timer = new
    timer.obj = obj
    timer.on_timer = b
    timer.handler = Android::Os::Handler.new
    obj.schedule timer, 0, 100
    timer
  end

  def run
    @handler.post -> { @on_timer.call if @on_timer }
  end

  def invalidate
    @obj.cancel
  end
end
