require_relative 'instrument'
class FigureContainer
  def initialize
  @list = []
  end
  def add(figure)
    @list<<figure
  end
  def delete_by_index(index)
    @list.delete_at(index)
  end
  def delete_obj(obj)
    @list.delete(obj)
  end
  def drawall(canvas)
    @list.each{|figure| figure.draw(canvas)}
  end
end