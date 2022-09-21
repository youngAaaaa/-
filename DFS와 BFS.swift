import Foundation

func dfs(node: Int){
    visited[node] = true
    print(node, terminator: " ")
    for i in 0..<graph[node]!.count{
        let next = graph[node]![i]
        if !visited[next] {
            dfs(node: next)
        }
    }
}

func bfs(start: Int){
    var queue = [Int]()
    visited = [Bool](repeating: false, count: n+1)
    visited[start] = true
    queue.append(start)
    while(!queue.isEmpty){
        let node = queue.removeFirst()
        print(node, terminator: " ")
        for i in 0..<graph[node]!.count{
            let next = graph[node]![i]
            if !visited[next] {
                queue.append(next)
                visited[next] = true
            }
        }
    }
}

let nmv = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nmv[0], m = nmv[1], v = nmv[2]
var graph = [Int:[Int]]()
var visited = [Bool](repeating: false, count: n+1)

for i in 1...n{
    graph.updateValue([], forKey: i)
}

for _ in 0..<m{
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    graph[input[0]]?.append(input[1])
    graph[input[1]]?.append(input[0])
}

for i in 1...n{
    graph[i]?.sort()
}

dfs(node: v)
print("")
bfs(start: v)
