import Foundation

let dx = [0, 0, -1, 1, 0, 0]
let dy = [-1, 1, 0, 0, 0, 0]
let dz = [0, 0, 0, 0, -1, 1]

while true {
    let lrc = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let l = lrc[0], r = lrc[1], c = lrc[2]
    
    if l == 0, r == 0, c == 0 { exit(0) }
    
    var building = [[[String]]](repeating: [[String]](repeating: [String](), count: r), count: l)
    var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: c), count: r), count: l)
    
    var queue = [(Int, Int, Int)]()
    for k in 0..<l{
        for i in 0..<r {
            let input = readLine()!.map({ String($0) })
            building[k][i].append(contentsOf: input)
            for j in 0..<input.count {
                if input[j] == "S" {
                    queue.append((k, i, j))
                    dist[k][i][j] = 0
                }
            }
        }
        _ = readLine()
    }
    
    var index = 0
    var escape = false
    while index < queue.count {
        let (z, x, y) = (queue[index].0, queue[index].1, queue[index].2)
        index += 1
        
        for k in 0..<6 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            let nz = z + dz[k]
            
            if nx < 0 || nx >= r || ny < 0 || ny >= c || nz < 0 || nz >= l { continue }
            if dist[nz][nx][ny] >= 0 || building[nz][nx][ny] == "#" { continue }
            if building[nz][nx][ny] == "E" {
                print("Escaped in \(dist[z][x][y] + 1) minute(s).")
                escape = true
                break
            }
            
            queue.append((nz, nx, ny))
            dist[nz][nx][ny] = dist[z][x][y] + 1
        }
        
        if true == escape {
            break
        }
    }
    
    if false == escape {
        print("Trapped!")
    }
}
