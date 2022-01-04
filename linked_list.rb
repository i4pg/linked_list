class Node
  attr_accessor :value, :next_node
  attr_reader :counter

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def append(value)
    curr_head = Node.new(value)
    if @head.nil?
      @head = curr_head
    else
      @tail.next_node = curr_head
    end
    @tail = curr_head
  end

  def prepend(value)
    curr_head = Node.new(value)

    if @head.nil?
      @head = curr_head
    else
      curr_head.next_node = @head
      @head = curr_head
    end
  end

  def size
    @counter = 0
    @curr_head = @head

    def count
      @counter += 1

      return @counter if @curr_head.next_node.nil?

      @curr_head = @curr_head.next_node
      count
    end
    count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    @i = 0
    def search(index)
      return @head.value if index == @i
      return 'no value' if @head.next_node.nil?

      @i += 1
      @head = @head.next_node
      search(index)
    end
    search(index)
  end

  def print_all
    p @head.value

    return if @head.next_node.nil?

    @head = @head.next_node
    print_all
  end

  def pop
    @popping = 0
    @pop_head = @head
    def search
      return if @pop_head.next_node.nil?

      @pop_head = @pop_head.next_node
      @popping += 1
      if @popping == size - 2
        @pop_head.next_node = nil
        @tail = @pop_head
      end
      search
    end
    search
  end

  def contains?(value)
    return false if @head.next_node.nil?
    return true if @head.value == value

    @head = @head.next_node
    contains?(value)
  end

  def find(value)
    i = 0
    find_lambda = lambda { |value|
      return i if @head.value == value
      return nil if @head.next_node.nil?

      @head = @head.next_node
      i += 1
      find_lambda.call(value)
    }
    find_lambda.call(value)
  end

  def to_s
    array = []
    arry_lambda = lambda {
      return array unless @head

      array.push(@head.value)
      @head = @head.next_node

      arry_lambda.call
    }
    arry_lambda.call
    array.push(nil)
    "( #{array.join(' ) -> ( ')}nil )"
  end
end

list = LinkedList.new

list.append('Abdullah')
list.append('shaif')
list.append('mahfood')
list.prepend('tariq')
# list.pop
# list.tail
# list.contains?('shai')
# list.find('shaif')
p list.to_s
