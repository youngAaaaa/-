import Foundation

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var tomato = [[Int]]()
let mn = readLine()!.split(separator: " ").map({ Int(String($0))! })
let m = mn[0], n = mn[1]
var dist = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
var queue = [(Int,Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    tomato.append(input)
    
    for j in 0..<input.count {
        if input[j] == 1 {
            queue.append((i, j))
        }
        if input[j] == 0 {
            dist[i][j] = -1
        }
    }
}

var index = 0
while index < queue.count {
    let x = queue[index].0
    let y = queue[index].1
    index += 1
    
    for k in 0..<4 {
        let nx = x + dx[k]
        let ny = y + dy[k]
        if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
        if dist[nx][ny] >= 0 { continue }
        dist[nx][ny] = dist[x][y] + 1
        queue.append((nx, ny))
    }
}

var ans = 0
for i in 0..<n {
    for j in 0..<m{
        if dist[i][j] == -1 {
            print("-1")
            exit(0)
        }
        ans = max(dist[i][j], ans)
    }
}

print(ans)
