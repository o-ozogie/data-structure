class Graph
  # 그래프 인스턴스 생성 시 빈 해시와 노드를 할당할 count변수를 초기화 한다.
  def initialize
    @graph = {}
    @count = 0
  end

  # 정점을 추가하는 메소드. 가변인자로 추가한 정점의 연결되는 간선을 받는다.
  # 정점의 값은 대문자 A부터 차례대로 할당되며, graph의 key에 정점의 값, value에 정점에 연결되는 다른 정점의 간선과,
  # 해당 간선의 cost가 각각 key: value 로 연결되는 해시를 할당한다.
  def add_vertex(**kwargs)
    new_vertex = (65 + @count).chr.to_sym
    @graph[new_vertex] = {}

    kwargs.each do |vertex, cost|
      next unless @graph[vertex]

      @graph[new_vertex][vertex] = cost
    end

    @count += 1
    @graph[new_vertex]
  end

  # 간선을 추가하는 메소드, 간선의 방향을 start_vertex와 end_vertex 인자로 받으며, 간선의 cost도 설정할 수 있다.
  # 만약 간선에 올바르지 않은 정점이 포함된다면, false를 반환하며 간선이 추가되지 않는다.
  def add_edge(start_vertex, end_vertex, cost)
    return false unless @graph[start_vertex] && @graph[end_vertex]

    @graph[start_vertex][end_vertex] = cost
    @graph[start_vertex]
  end

  # 정점을 삭제하는 메소드. 그래프를 순회하며, 삭제할 정점과 연결된 간선을 전부 삭제한 후, 해당 정점을 삭제한다.
  def remove_vertex(value)
    return false unless @graph[value]

    @graph.each do |key, vertex|
      next if vertex.empty?

      vertex.each_key do |end_vertex|
        @graph[key].delete(end_vertex) if value == end_vertex
      end
    end

    @graph.delete(value)
  end

  # 간선을 삭제하는 메소드, 간선이 시작되는 정점과 끝나는 정점을 인자로 넘겨받아 삭제한다.
  def remove_edge(start_vertex, end_vertex)
    if @graph[start_vertex] && @graph[end_vertex]
      @graph[start_vertex].delete(end_vertex)
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

graph.add_vertex
graph.add_vertex
graph.add_vertex

graph.show_graph

graph.add_vertex(B: 1, C: 2)
graph.add_edge(:B, :C, 3)

graph.show_graph

graph.remove_vertex(:B)
graph.remove_edge(:D, :C)
graph.show_graph
