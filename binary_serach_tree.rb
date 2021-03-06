class Node
  attr_accessor :value, :left_child, :right_child

  # bst의 노드 구조.
  # value와 left_child, right_child를 인스턴스 변수로 가진다.
  def initialize(value)
    @value = value

    @left_child = nil
    @right_child = nil
  end
end

class BinarySearchTree
  attr_accessor :preorder, :inorder, :postorder, :head
  # 객체를 생성할 때, 새 노드를 생성하고 해당 노드를 헤드노드로 지정한다.
  def initialize(value)
    @tree = Node.new(value)
    @head = @tree

    @preorder = []
    @inorder = []
    @postorder = []
  end

  # 삽입할 값이 현재 노드의 값보다 작으면 왼쪽 자식, 작지 않으면 오른쪽 자식을 현재 값으로 지정한다.
  # 노드가 삽입될 자리를 찾으면 왼쪽이나 오른쪽 자식노드로 삽입한다.
  def push(value)
    current = @head
    left = false

    until current.nil?
      previous = current
      if current.value > value
        current = current.left_child
        left = true
      else
        current = current.right_child
        left = false
      end
    end

    previous.left_child = Node.new(value) if left
    previous.right_child = Node.new(value) unless left
  end

  # level은 트리에서 노드의 높이를 나타낸다.
  # 트리를 순회하며 level과 노드의 값을 출력한다.
  def show(current = @head, left = nil, level = 1)
    return unless current

    if left.nil?
      print '[head]'
    elsif left
      print '[left]'
    else
      print '[right]'
    end

    p "level #{level} => #{current.value}"

    show(current.left_child, true, level + 1)
    show(current.right_child, false, level + 1)
  end

  # value값을 가진 노드를 탐색한다.
  # value가 현재 노드면 current를 출력하고, value가 현재 노드보다 작으면 왼쪽 서브트리,
  # 작지 않으몬 오른쪽 서브트리를 순회하며 탐색한다. 트리를 모두 순회해도 값을 찾지 못하면 false를 반환한다.
  def search(value)
    current = @head

    until current.nil?
      if current.value == value
        return current
      elsif current.value > value
        current = current.left_child
      else
        current = current.right_child
      end
    end

    false
  end

  # 값 삭제 메소드는 더 공부해서 추후 구현 예정.

  # BST의 세 가지 순회 종류 구현
  # 왼쪽이나 오른쪽 자식 노드가 존재할 경우, 계속해서 재귀호출 하도록 설계하였다.

  # preorder 메소드는 부모 노드 - 왼쪽 자식 노드 - 오른쪽 자식 노드 순으로 순회한다.
  def preorder(node = @head)
    @preorder << node.value
    preorder(node.left_child) if node.left_child
    preorder(node.right_child) if node.right_child

    @preorder
  end

  # inorder 메소드는 왼쪽 자식 노드 - 부모 노드 - 오른쪽 자식 노드 순으로 순회한다.
  def inorder(node = @head)
    inorder(node.left_child) if node.left_child
    @inorder << node.value
    inorder(node.right_child) if node.right_child

    @inorder
  end

  # postorder 메소드는 왼쪽 자식 노드 - 오른쪽 자식 노드 - 부모 노드 순으로 순회한다.
  def postorder(node = @head)
    postorder(node.left_child) if node.left_child
    postorder(node.right_child) if node.right_child
    @postorder << node.value
  end
end

# 앞서 구현한 메소드는 인스턴스 변수에 결과 배열을 저장하므로, 두 번 이상 호출하면 값이 쌓인다.
# 이 문제를 해결하기 위해서 데코레이터 패턴을 적용하여 함수가 시작하기 전에 저장될 배열을 초기화하고 함수가 작동하도록 하였다.
class BSTHelper < SimpleDelegator
  def preorder(node = head)
    self.preorder = []
    super(node)
  end

  def inorder(node = head)
    self.inorder = []
    super(node)
  end

  def postorder(node = head)
    self.postorder = []
    super(node)
  end
end

bst = BinarySearchTree.new(10)
bst.push(3)
bst.push(20)
bst.push(1)
bst.push(2)

bst_extended = BSTHelper.new(bst)
p bst_extended.preorder
p bst_extended.inorder
p bst_extended.postorder

p bst_extended.preorder
p bst_extended.inorder
p bst_extended.postorder

p bst_extended.preorder
p bst_extended.inorder
p bst_extended.postorder