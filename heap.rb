class Heap
  # 객체를 생성하면 빈 배열과, 힙 트리의 크기를 초기화한다.
  def initialize
    @heap = []
    @size = 0
  end

  # 힙에 노드를 추가하는 메소드.
  # 우선 노드를 추가하고 최대 힙트리로 재정렬한다.
  def push(*args)
    args.each do |arg|
      @heap << arg
      @size += 1
    end
    heapify
  end

  def show
    p @heap
  end

  # 힙에서의 원소를 pop하는 메소드.
  # 최대 힙 트리의 맨 윗 값(최대값)을 pop한 후, 재정렬한다.
  def pop
    @heap.pop
    heapify
  end

  # 힙 정렬 알고리즘.
  # 최대 힙에서의 첫 번째 노드와 마지막 노드를 교환한 후, 마지막 노드를 pop한다. size를 하나 줄이고 힙트리를 재정렬한다.
  # 이 과정을 heap 트리의 크기가 0이 되기 이전까지 반복한다.
  def sort
    result = []

    while @size >= 1
      @heap[0], @heap[-1] = @heap[-1], @heap[0]
      result.unshift(@heap.pop)
      @size -= 1
      heapify
    end

    @heap = result
    @size = result.length - 1

    @heap
  end

  private

  # 재배치 알고리즘.
  # 자식노드가 있는 노드들에서부터 최상위 노드까지 sift down한다.
  def heapify
    count = @size / 2 - 1

    while count >= 0
      sift_down(count)
      count -= 1
    end
    @heap
  end

  # sift down 알고리즘.
  # 부모노드와 자식노드 2개의 값 중, 가장 큰 값을 부모노드와 교환한다.
  # 또 교환한 노드가 자식 노드 중 하나일 경우, 자식 노드의 자식 노드와 재귀적으로 sift down 한다.
  def sift_down(count)
    left = count * 2 + 1
    right = left + 1

    max = count
    max = left if left <= @size - 1 && @heap[left] > @heap[count]
    max = right if right <= @size - 1 && @heap[right] > @heap[max]

    unless max == count
      @heap[max], @heap[count] = @heap[count], @heap[max]
      sift_down(max)
    end
  end
end

heap = Heap.new

heap.push(1, 3, 2, 4, 9, 7)
heap.show
p heap.sort
p heap.pop