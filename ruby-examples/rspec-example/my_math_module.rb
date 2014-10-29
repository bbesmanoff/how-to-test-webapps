module MyMathModule
  def self.abs(val)
    if val >= 0
      val
    else
      val * -1
    end
  end
end
