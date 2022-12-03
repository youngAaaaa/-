import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs(_ x: Int, _ y: Int, _ rain: Int ) {
    var queue = [(x, y)]
    visited[x][y] = true
    
    var index = 0
    var cnt = 0
    while index < queue.count {
        let (i, j) = (queue[index].0, queue[index].1)
        index += 1
        
        for k in 0..<4 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
            if visited[nx][ny] || board[nx][ny] <= rain { continue }
            cnt += 1
            queue.append((nx, ny))
            visited[nx][ny] = true
        }
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()
var height = [Int]()
var visited = [[Bool]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    board.append(input)
    for i in 0..<n {
        if !height.contains(input[i]) {
            height.append(input[i])
        }
    }
}

var ans = [1] // "아무 지역도 물에 잠기지 않을 수도 있다."
for rain in height {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
    var cnt = 0
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j], board[i][j] > rain {
                bfs(i, j, rain)
                cnt += 1
            }
        }
    }
    ans.append(cnt)
}

print(ans.max()!)
