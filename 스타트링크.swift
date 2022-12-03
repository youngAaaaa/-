import Foundation

let fsgud = readLine()!.split(separator: " ").map({ Int(String($0))! })
let f = fsgud[0], s = fsgud[1], g = fsgud[2], u = fsgud[3], d = fsgud[4]

var dist = [Int](repeating: -1, count: f + 1)
dist[s] = 0
var queue = [s]
var index = 0

if s == g {
    print(0)
    exit(0)
}

while index < queue.count {
    let x = queue[index]
    index += 1
    
    for i in 0..<2 {
        let nx: Int
        if i == 0 {
            nx = x + u
        }
        else {
            nx = x - d
        }
        
        if nx == g {
            print(dist[x] + 1)
            exit(0)
        }
        if nx < 1 || nx > f { continue }
        if dist[nx] >= 0 { continue }
        
        queue.append(nx)
        dist[nx] = dist[x] + 1
    }
}

print("use the stairs")
