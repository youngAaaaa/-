import Foundation

func bfs(start: Int, target: Int) -> Int{
    var queue = [Int]()
    queue.append(start)
    visited[start] = true
    while true{
        let node = queue.removeFirst()
        if node == target {
            break
        }
        for i in 0..<3{
            var next: Int
            if i == 0 { next = node - 1 }
            else if i == 1 { next = node + 1 }
            else { next = node * 2 }
            
            if next < 0 || next > 100000 || visited[next]{ continue }
            queue.append(next)
            visited[next] = true
            time[next] = time[node] + 1
        }
        
    }
    return time[target]
}

let nk = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nk[0], k = nk[1]
var visited = [Bool](repeating: false, count: 100001)
var time = [Int](repeating: 0, count: 100001)

print(bfs(start: n, target: k))
