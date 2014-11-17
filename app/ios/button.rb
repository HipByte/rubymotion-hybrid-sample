class Button
  attr_accessor :on_tap, :__obj__
  def self.make(text_normal, text_selected, &block)
    button = new
    obj = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    obj.setTitle(text_normal, forState:UIControlStateNormal)
    obj.setTitle(text_selected, forState:UIControlStateSelected)
    obj.sizeToFit
    obj.addTarget(button, action:'_actionTapped', forControlEvents:UIControlEventTouchUpInside)
    obj.instance_variable_set(:@__wrapper__, button)
    button.__obj__ = obj
    button.on_tap = block
    obj
  end

  def _actionTapped
    @on_tap.call if @on_tap
    @__obj__.selected = !@__obj__.selected?
  end
end
