class Screen < UIViewController
  def viewDidLoad
    on_load
  end

  Spacing = 0.0
  def <<(view)
    @layout_y ||= 15.0
    rect = view.frame
    rect.size.width = self.view.frame.size.width
    rect.origin.y = @layout_y
    view.frame = rect
    @layout_y += rect.size.height + Spacing

    self.view.addSubview(view)
  end
end
