import Foundation

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

func bfs(_ n: Int, _ m: Int, _ x: Int, _ y: Int) {
    var queue = [(Int, Int)]()
    queue.append((x, y))
    visited[x][y] = true
    
    var index = 0
    while index < queue.count {
        let (i, j) = (queue[index].0, queue[index].1)
        index += 1
        
        for k in 0..<4 {
            let nx = dx[k] + i
            let ny = dy[k] + j
            if (nx < 0 || nx >= n || ny < 0 || ny >= m) { continue }
            if baechu[nx][ny] != 1 || visited[nx][ny] { continue }
            
            queue.append((nx, ny))
            visited[nx][ny] = true
        }
            
    }
}

var t = Int(readLine()!)!
var baechu = [[Int]]()
var visited = [[Bool]]()

while t > 0 {
    let mnk = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let m = mnk[0], n = mnk[1], k = mnk[2]
    baechu = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
    visited = [[Bool]](repeating: [Bool](repeating: false, count: m + 1), count: n + 1)
    var ans = 0
    
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
        baechu[input[1]][input[0]] = 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if baechu[i][j] == 1, !visited[i][j] {
                bfs(n, m, i, j)
                ans += 1
            }
        }
    }
    print(ans)
    t -= 1
}
