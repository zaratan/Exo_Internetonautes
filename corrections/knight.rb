#! /usr/bin/env ruby

class Position
  def initialize(x_pos, y_pos)
    @x_pos = x_pos
    @y_pos = y_pos
  end

  def self.from_position_array(position_array)
    new(position_array[0].ord - 'A'.ord, position_array[1] - 1)
  end

  def to_pos_arr
    [('A'.ord + x_pos).chr, y_pos + 1]
  end

  def valid?
    x_pos >= 0 && x_pos < 8 && y_pos >= 0 && y_pos < 8
  end

  def ==(other)
    x_pos == other.x_pos && y_pos == other.y_pos
  end

  attr_reader :x_pos, :y_pos
end

class FifoNode
  attr_accessor :position, :path, :next

  def initialize(position, path = [])
    @position = position
    @path = path
    @next = nil
  end
end

class Fifo
  def initialize
    @head = nil
    @last = nil
  end

  def push(position, path = [])
    new_node = FifoNode.new(position, path)
    if @head == nil
      @head = new_node
      @last = @head
    else
      @last.next = new_node
      @last = new_node
    end
  end

  def pop
    return nil unless @head
    res = @head
    @head = @head.next
    res
  end
end

KNIGHT_MOVES = [
  [-1, +2],
  [+1, +2],
  [-1, -2],
  [+1, -2],
  [-2, +1],
  [-2, -1],
  [+2, +1],
  [+2, -1],
].freeze

# rec
def search_path_aux(fifo, end_position)
  node = fifo.pop

  KNIGHT_MOVES.each do |mod|
    move =
      Position.new(node.position.x_pos + mod[0], node.position.y_pos + mod[1])
    if move.valid?
      # We dup the path because pointer
      path = node.path.dup << move
      return path if move == end_position
      fifo.push(move, path)
    end
  end

  search_path_aux(fifo, end_position)
end

def search_path(start_position, end_position)
  fifo = Fifo.new
  fifo.push(start_position)
  search_path_aux(fifo, end_position)
end

def solution(start_pos, end_pos)
  start_position = Position.from_position_array(start_pos)
  end_position = Position.from_position_array(end_pos)

  return { count: 0, path: [start_pos] } if start_position == end_position

  sol_path = search_path(start_position, end_position)

  { count: sol_path.size, path: sol_path.map(&:to_pos_arr) }
end

p solution(['A', 1], ['A', 1])
p solution(['A', 1], ['C', 5])
p solution(['A', 1], ['E', 8])
