class Label
  def self.make(text)
    obj = UILabel.new
    obj.text = text
    obj.textColor = UIColor.whiteColor
    obj.backgroundColor = UIColor.clearColor
    obj.textAlignment = UITextAlignmentCenter
    obj.sizeToFit
    obj
  end
end
