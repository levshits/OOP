require 'tk'
require 'yaml'
require_relative 'instrument'
require_relative 'line'
require_relative 'rectangle'
require_relative 'ellipse'
require_relative 'figure_container'

$figures = FigureContainer.new
$instrument = Line
$start_x = 0
$start_y = 0
$color = 'red'
root_window = TkRoot.new('title'=>'OOP') do
  minsize(500,400)
end

buttons_frame = TkFrame.new(root_window) do
  background 'red'
  width 100
  padx 5
  pady 5
  pack('fill'=>'y','side'=>'left')
end
canvas_frame = TkFrame.new(root_window) do
  pack('fill'=>'both','expand'=>'yes')
end
canvas = TkCanvas.new(canvas_frame) do
  background 'white'
  pack('fill'=>'both','expand'=>'yes')
end
canvas.bind('ButtonPress-1',proc{|e|
  $start_x=e.x
  $start_y=e.y})
canvas.bind('ButtonRelease-1', proc{|e|
  $figures.add($instrument.new.draw_allparams(canvas,$start_x, $start_y,e.x,e.y,$color))
})
rectangle_button = TkButton.new(buttons_frame,'text'=>'Rectangle') do
  pack('fill'=>'both')
end
rectangle_button.bind('1',proc{$instrument = Rectangle})
ellipse_button = TkButton.new(buttons_frame,'text'=>'Ellipse') do
  pack('fill'=>'both')
end
ellipse_button.bind('1',proc{$instrument = Ellipse})
line_button = TkButton.new(buttons_frame,'text'=>'Line') do
  pack('fill'=>'both')
end
line_button.bind('1',proc{$instrument = Line})
open_button = TkButton.new(buttons_frame,'text'=>'Open') do
  pack('fill'=>'both', 'side'=>'bottom')
  bind('1',proc{
    File.open('result.bin') do |file|
      #$figures = Marshal.load (file)
      $figures = YAML::load file
    end
    $figures.drawall(canvas)
  })
end
save_button = TkButton.new(buttons_frame,'text'=>'Save') do
  pack('fill'=>'both', 'side'=>'bottom')
  bind('1', proc{
    File.open('result.bin','w') do |file|
      #Marshal.dump($figures, file)
      file.puts YAML::dump($figures)
    end
  })
  choosecolor_button = TkButton.new(buttons_frame, 'text'=>'Color') do
    pack('fill'=>'both')
    bind('1', proc{
      $color = Tk.chooseColor
    })
  end
end

Tk.mainloop
p $figures
