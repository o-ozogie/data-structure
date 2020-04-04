class Heap
  def initialize
    @heap = []
    @size = -1
  end

  def push(*args)
    args.each do |arg|
      @heap.unshift(arg)
      @size += 1
    end
    shift_down
  end

  def pop(value, count = 0)
    if value == @heap[count]
      @heap.delete_at(count)
    elsif value < @heap[count]
      pop(value, count * 2 + 1)
      pop(value, count * 2 + 2)
    end
  end

  def show
    p @heap
  end

  def shift_down
    @heap.each_index.each do |index|
      left_index = index * 2 + 1
      right_index = index * 2 + 2

      if @size >= right_index
        if @heap[left_index] > @heap[right_index] && @heap[left_index] > @heap[index]
          @heap[left_index], @heap[index] = @heap[index], @heap[left_index]
        elsif @heap[right_index] > @heap[left_index] && @heap[right_index] > @heap[index]
          @heap[right_index], @heap[index] = @heap[index], @heap[right_index]
        end
      elsif @size == left_index
        if @heap[left_index] > @heap[index]
          @heap[left_index], @heap[index] = @heap[index], @heap[left_index]
        end
      end
    end
  end
end

heap = Heap.new

heap.push(1, 5, 3, 4, 10, 4, 3, 6, 222)
heap.pop(222)
heap.show