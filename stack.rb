class Stack
  def initialize
    # 인스턴스가 생성되면 인스턴스 변수에 빈 배열 할당
    @stack = []
  end

  def push(*args)
    # stack에 원소를 삽입하면, 배열의 끝에서부터 원소가 삽입됨.
    args.each { |arg| @stack.append(arg) }
  end

  def pop
    # stack에서 원소를 pop하면, 배열의 끝에서부터 원소가 pop됨.
    @stack.pop
  end
end

stack = Stack.new
stack.push(1, 2, 3, 4)
4.times do
  p stack.pop
end