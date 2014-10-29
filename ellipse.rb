require 'tk'
require_relative 'instrument'
class Ellipse<Instrument
  def draw(canvas)
    TkcOval.new(canvas,@start_x,@start_y,@x,@y,'fill' => @color)
  end
end