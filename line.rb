require 'tk'
require_relative 'instrument'
class Line < Instrument
  def draw(canvas)
    TkcLine.new(canvas,@start_x,@start_y,@x,@y,'fill' => @color)
  end
end