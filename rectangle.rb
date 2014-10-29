require 'tk'
require_relative 'instrument'
class Rectangle<Instrument
  def draw(canvas)
    TkcRectangle.new(canvas,@start_x,@start_y,@x,@y,'fill'=>@color)
  end
end