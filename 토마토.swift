import Foundation

let dx = [0, 0, -1, 1, 0, 0]
let dy = [1, -1, 0, 0, 0, 0]
let dz = [0, 0, 0, 0, -1, 1]

let mnh = readLine()!.split(separator: " ").map({ Int(String($0))! })
let m = mnh[0], n = mnh[1], h = mnh[2]
var tomato = [[[Int]]](repeating: [], count: h)
var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: m), count: n), count: h)
var queue = [(Int, Int, Int)]()

var zero = 0
for i in 0..<h {
    for j in 0..<n {
        let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
        tomato[i].append(input)
        for k in 0..<m {
            if input[k] == 1 {
                queue.append((i, j, k))
                dist[i][j][k] = 0
            }
            if input[k] == 0 {
                zero += 1
            }
        }
    }
}

var index = 0
var ans = 0
while index < queue.count {
    let (z, x, y) = (queue[index].0, queue[index].1, queue[index].2)
    index += 1
    
    for k in 0..<6 {
        let nx = x + dx[k]
        let ny = y + dy[k]
        let nz = z + dz[k]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m || nz < 0 || nz >= h { continue }
        if dist[nz][nx][ny] >= 0 || tomato[nz][nx][ny] == -1 { continue }
        
        zero -= 1
        queue.append((nz, nx, ny))
        dist[nz][nx][ny] = dist[z][x][y] + 1
        
        if dist[nz][nx][ny] > ans { ans = dist[nz][nx][ny] }
    }
}

if zero > 0 {
    print(-1)
}
else {
    print(ans)
}
