class Queue
  def initialize
    # 인스턴스가 생성되면 인스턴스 변수에 빈 배열 할당
    @queue = []
  end

  def push(*args)
    # queue에 원소를 삽입하면, 배열의 앞에서부터 원소가 삽입됨.
    args.each { |arg| @queue.unshift(arg) }
  end

  def pop
    # queue에서 원소를 pop하면, 배열의 끝에서부터 원소가 pop됨.
    @queue.pop
  end
end

queue = Queue.new
queue.push(1, 2, 3, 4)
4.times do
  p queue.pop
end