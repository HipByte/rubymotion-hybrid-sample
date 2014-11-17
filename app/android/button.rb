class Button
  attr_accessor :normal_text, :selected_text, :on_tap, :__obj__
  attr_reader :selected
  def self.make(normal_text, selected_text, &block)
    obj = Android::Widget::Button.new(Screen.current)
    obj.text = normal_text
    button = new
    obj.onClickListener = button
    button.__obj__ = obj
    button.on_tap = block
    button.normal_text = normal_text
    button.selected_text = selected_text
    obj
  end

  def onClick(view)
    @on_tap.call if @on_tap
    @__obj__.text = (@selected = !@selected) ? @selected_text : @normal_text
  end
end
