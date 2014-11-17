class MainScreen < Screen
  def on_load
    @label = Label.make('Tap to start')
    @button = Button.make('Start', 'Stop') { timer_tap }

    self << @label
    self << @button
  end

  def timer_tap
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @duration = 0
      @timer = Timer.make(0.1) do
        @label.text = "%.1f" % (@duration += 0.1)
      end
    end
  end
end
