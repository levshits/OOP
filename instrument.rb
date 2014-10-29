require 'tk'
class Instrument
  def draw_allparams(canvas,start_x, start_y, x, y, color)
    @start_x = start_x
    @start_y = start_y
    @x = x
    @y = y
    @color = color
    draw(canvas)
    return self
  end
  def draw(canvas)
  end
end