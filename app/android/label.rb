class Label
  def self.make(text)
    obj = Android::Widget::TextView.new(Screen.current)
    obj.text = text
    obj.textSize = 24.0
    obj.gravity = Android::View::Gravity::CENTER_HORIZONTAL
    obj
  end
end
