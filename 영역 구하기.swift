import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs(_ x: Int, _ y: Int) -> Int{
    var queue = [(x, y)]
    visited[x][y] = true
    
    var index = 0
    var ans = 1
    while index < queue.count{
        let (i, j) = (queue[index].0, queue[index].1)
        index += 1
        
        for k in 0..<4{
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
            if board[nx][ny] == 1 || visited[nx][ny] { continue }
            
            ans += 1
            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
    
    return ans
}

let mnk = readLine()!.split(separator: " ").map({ Int(String($0))! })
let m = mnk[0], n = mnk[1], k = mnk[2]

var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let y1 = input[0], x1 = input[1], y2 = input[2], x2 = input[3]
    
    for i in min(x1, x2)..<max(x1, x2){
        for j in min(y1, y2)..<max(y1, y2){
            board[i][j] = 1
        }
    }
}

var ans = [Int]()
for i in 0..<m {
    for j in 0..<n {
        if board[i][j] == 0, !visited[i][j]{
            let num = bfs(i, j)
            ans.append(num)
        }
    }
}

ans.sorted(by: <).forEach({ print($0, terminator: " ") })
