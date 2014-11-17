class Screen < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    Screen.push_current self
    on_load
  end

  def on_load
    # Do nothing.
  end

  def self.push_current(activity)
    @activities ||= []
    @activities << activity
  end

  def self.pop_current
    @activities.pop
  end

  def self.current
    @activities.last
  end 

  def <<(view)
    @layout ||= begin
      layout = Android::Widget::LinearLayout.new(self)
      layout.orientation = Android::Widget::LinearLayout::VERTICAL
      self.contentView = layout
      layout
    end
    @layout.addView(view)
  end
end
