class Line < Struct.new(:start, :finish)
  def points
    lower_x, upper_x = [start.x, finish.x].sort
    lower_y, upper_y = [start.y, finish.y].sort

    if horizontal? || vertical?
      straight_points
    else
      diagnal_points
    end
  end

  def horizontal?
    start.y == finish.y
  end

  def vertical?
    start.x == finish.x
  end

  private

  def straight_points
    lower_x, upper_x = [start.x, finish.x].sort
    lower_y, upper_y = [start.y, finish.y].sort

    (lower_x..upper_x).to_a.product((lower_y..upper_y).to_a)
  end

  def diagnal_points
    x_points = start.x > finish.x ? start.x.downto(finish.x) : start.x.upto(finish.x)
    y_points = start.y > finish.y ? start.y.downto(finish.y) : start.y.upto(finish.y)

    x_points.zip(y_points)
  end
end

class Coordinate < Struct.new(:x, :y); end
