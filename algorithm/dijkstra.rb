require_relative '../graph'

def dijkstra(graph, start_vertex)
  # 각 정점과 비용을 key-value로 정리하기 위해서 거리 계산을 위한 distance 변수,
  # 방문한 정점을 확인하기 위한 visited 변수를 빈 해시로 초기화한다.
  distance = {}
  visited = {}

  # 가장 작은 비용을 저장하기 위한 minimum 변수,
  # minimum 비용에 해당하는 정점을 저장하기 위한 minimum_vertex 변수를
  # 각각 0과 출발 정점으로 초기화 한다.
  minimum = 0
  minimum_vertex = start_vertex

  # distance 변수에 그래프에 있는 정점에 해당하는 비용을 전부 무한대로 초기화한다.
  # 시작 인덱스는 예외로, 0을 넣어준다.
  graph.each_key do |vertex|
    if vertex == start_vertex
      distance[vertex] = 0
      next
    end
    distance[vertex] = Float::INFINITY
  end

  # distance 변수에 값이 존재하는 동안,
  until distance.empty?
    # distance의 가장 작은 비용을 가진 정점을 삭제한다.
    # visited 변수에 삭제된 정점-비용을 저장한다.
    distance.delete(minimum_vertex)
    visited[minimum_vertex] = minimum

    # 그래프에서 가장 작은 정점에 연결된 정점들을 순회한다.
    # 정점이 방문하지 않았던 정점 중에서, distance 변수에 저장되어 있는 정점의 값이
    # 다른 정점을 경유했을 때 보다 크다면, 값을 갱신한다.
    graph[minimum_vertex].each do |vertex, cost|
      next if visited.keys.include?(vertex)

      distance[vertex] = (minimum + cost) if distance[vertex] > (minimum + cost)
    end

    # distance 안에 있는 정점 중에서 가장 작은 비용과 해당 비용을 가진 정점으로
    # minimum 변수와 minimum_vertex 변수를 갱신한다.
    costs = []
    vertexes = []
    distance.each do |vertex, cost|
      costs << cost
      vertexes << vertex
    end

    minimum = costs.min
    minimum_vertex = distance.key(minimum)
  end
  visited
end

graph = Graph.new

6.times { graph.add_vertex }
graph.add_edge(:A, :B, 3)
graph.add_edge(:A, :C, 2)
graph.add_edge(:A, :D, 4)
graph.add_edge(:B, :D, 2)
graph.add_edge(:B, :F, 5)
graph.add_edge(:C, :E, 1)
graph.add_edge(:D, :E, 3)
graph.add_edge(:D, :F, 3)
graph.add_edge(:E, :F, 2)

p dijkstra(graph.show_graph, :A)