import Foundation

let dx = [-1, -2, -2, -1, 1, 2, 2, 1]
let dy = [-2, -1, 1, 2, 2, 1, -1, -2]

var t = Int(readLine()!)!
while t > 0 {
    t -= 1
    
    let l = Int(readLine()!)!
    var dist = [[Int]](repeating: [Int](repeating: -1, count: l + 1), count: l + 1)
    
    let start = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let startX = start[0], startY = start[1]
    
    let target = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let targetX = target[0], targetY = target[1]
    
    var index = 0
    var queue = [(startX, startY)]
    dist[startX][startY] = 0
    
    while index < queue.count{
        let (x, y) = (queue[index].0, queue[index].1)
        index += 1
        
        for k in 0..<8 {
            let nx = dx[k] + x
            let ny = dy[k] + y
            
            if nx < 0 || nx >= l || ny < 0 || ny >= l { continue }
            if dist[nx][ny] >= 0 { continue }
            dist[nx][ny] = dist[x][y] + 1
            queue.append((nx, ny))
        }
    }
    
    print(dist[targetX][targetY])
}

