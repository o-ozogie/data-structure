# 노드 클래스. 값과 주소로 이루어져 있다.
class Node
  attr_accessor :value, :address

  def initialize(value)
    @value = value
    @address = nil
  end
end

class LinkedList
  # 객체 생성 시 노드가 하나 생성되며, 해당 노드가 헤드 노드가 된다.
  def initialize(value)
    @head = Node.new(value)
  end

  # 헤드 노드부터 순회하며 탐색하여 주소가 빈, 가장 최근에 삽입 된 노드 뒤에 새 노드를 삽입한다.
  def add_node(value)
    current = @head
    current = current.address until current.address.nil?

    current.address = Node.new(value)
  end

  # 헤드 노드부터 순회하며 삭제할 값을 가진 노드를 주소로 가진 노드(삭제할 노드의 전 노드)를 삭제할 노드 다음 노드로 연결한다.
  # 연결리스트를 모두 순회했는데도 삭제할 값을 가진 노드를 찾지 못하면, 에러 메새지를 반환한다.
  def remove_node(value)
    current = @head
    until current.nil?
      return p "'#{value}' doesn't exist" if current.address.nil?

      if current.address.value == value
        return current.address = current.address.address
      end

      current = current.address
    end
  end

  # 노드를 쭉 순회하며 노드의 값을 출력한다.
  def show_node
    current = @head
    until current.address.nil?
      print "#{current.value} => "
      current = current.address
    end
    print "#{current.value} => nil\n"
  end

  # 현재 노드의 주소(다음 노드)를 follow 변수에 저장 후, 현재 노드의 주소를 이전 노드로 연결한다.
  # 그리고 follow 변수의 값을 다시 현재 노드로 지정하고 같은 작업을 반복한다.
  # 끝으로, 마지막으로 연결 된 노드를 헤드 노드로 지정한다.
  def reverse_node
    current = @head
    previous = nil

    until current.nil?
      follow = current.address
      current.address = previous
      previous = current
      current = follow
    end

    @head = previous
  end
end

linked_list = LinkedList.new(1)

linked_list.add_node(2)
linked_list.add_node(3)
linked_list.show_node

linked_list.remove_node(3)
linked_list.show_node

linked_list.reverse_node
linked_list.show_node