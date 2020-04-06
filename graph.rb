class Graph
  # 그래프 인스턴스 생성 시 빈 해시와 노드를 할당할 count변수를 초기화 한다.
  def initialize
    @graph = {}
    @count = 0
  end

  # 노드를 추가하는 메소드. 가변인자로 추가한 노드와 연결되는 간선을 받는다.
  # 노드는 대문자 A부터 차례대로 할당되며, graph의 key에 노드의 값, value에 노드와 연결되는 다른 노드의 간선과,
  # 해당 간선의 cost가 각각 key: value 로 연결되는 해시를 할당한다.
  def add_node(**kwargs)
    new_node = (65 + @count).chr.to_sym
    @graph[new_node] = {}

    kwargs.each do |node, cost|
      next unless @graph[node]

      @graph[new_node][node] = cost
    end

    @count += 1
    @graph[new_node]
  end

  # 간선을 추가하는 메소드, 간선의 방향을 start_node와 end_node인자로 받으며, 간선의 cost도 설정할 수 있다.
  # 만약 간선에 올바르지 않은 노드가 포함된다면, false를 반환하며 간선이 추가되지 않는다.
  def add_vertex(start_node, end_node, cost)
    return false unless @graph[start_node] && @graph[end_node]

    @graph[start_node][end_node] = cost
    @graph[start_node]
  end

  # 노드를 삭제하는 메소드. 그래프를 순회하며, 삭제할 노드와 연결된 간선을 전부 삭제한 후, 해당 노드를 삭제한다.
  def remove_node(node)
    return false unless @graph[node]

    @graph.each do |key, vertex|
      next if vertex.empty?

      vertex.each_key do |end_node|
        @graph[key].delete(end_node) if node == end_node
      end
    end

    @graph.delete(node)
  end

  # 간선을 삭제하는 메소드, 간선이 시작되는 노드와 끝나는 노드를 인자로 넘겨받아 삭제한다.
  def remove_vertex(start_node, end_node)
    if @graph[start_node] && @graph[end_node]
      @graph[start_node].delete(end_node)
    else
      false
    end
  end

  # 해시의 값을 출력한다.
  def show_graph
    p @graph
  end
end

graph = Graph.new

graph.add_node
graph.add_node
graph.add_node

graph.show_graph

graph.add_node(B: 1, C: 2)
graph.add_vertex(:B, :C, 3)

graph.show_graph

graph.remove_node(:B)
graph.remove_vertex(:D, :C)
graph.show_graph
