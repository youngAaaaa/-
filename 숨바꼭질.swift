// 221202 제출-2	81864KB	16ms
import Foundation

func bfs(_ start: Int, _ target: Int) -> Int {
    var queue = [Int]()
    queue.append(start)
    dist[start] = 0
    
    var index = 0
    
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        if cur == target { break }
        
        for i in 0..<3 {
            let next: Int
            
            if i == 0 { next = cur - 1 }
            else if i == 1 { next = cur + 1}
            else { next = cur * 2 }
            
            if next < 0 || next > 100000 || dist[next] >= 0 { continue }
            queue.append(next)
            dist[next] = dist[cur] + 1
        }
    }
    
    return dist[target]
}

let nk = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nk[0], k = nk[1]
var dist = [Int](repeating: -1, count: 100001)

print(bfs(n, k))



// 220921 제출-1 	80796KB	380ms
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
