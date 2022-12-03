import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var testcase = Int(readLine()!)!
while testcase > 0 {
    testcase -= 1
    
    let wh = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let w = wh[0], h = wh[1]
    var board = [[String]]()
    
    var fQueue = [(Int, Int)]()
    var sQueue = [(Int, Int)]()
    var fDist = [[Int]](repeating: [Int](repeating: -1, count: w + 3), count: h + 3)
    var sDist = [[Int]](repeating: [Int](repeating: -1, count: w + 3), count: h + 3)
    
    for i in 0..<h {
        let input = readLine()!.map({ String($0) })
        board.append(input)
        
        for j in 0..<w {
            if input[j] == "*"{
                fQueue.append((i, j))
                fDist[i][j] = 0
            }
            if input[j] == "@"{
                sQueue.append((i, j))
                sDist[i][j] = 0
            }
        }
    }
    
    var index = 0
    while index < fQueue.count {
        let (x, y) = (fQueue[index].0, fQueue[index].1)
        index += 1
        
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if nx < 0 || nx >= h || ny < 0 || ny >= w { continue }
            if board[nx][ny] == "#" || fDist[nx][ny] >= 0 { continue }
            
            fDist[nx][ny] = fDist[x][y] + 1
            fQueue.append((nx, ny))
        }
    }
    
    index = 0
    var ans = 0
    var sflag = false
    while index < sQueue.count {
        let (x, y) = (sQueue[index].0, sQueue[index].1)
        index += 1
        
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            if nx < 0 || nx >= h || ny < 0 || ny >= w {
                sflag = true
                break
            }
            if board[nx][ny] == "*" || board[nx][ny] == "#" || sDist[nx][ny] >= 0 { continue }
            if fDist[nx][ny] != -1, fDist[nx][ny] <= sDist[x][y] + 1 { continue }
            sDist[nx][ny] = sDist[x][y] + 1
            sQueue.append((nx, ny))
            ans += 1
        }
        
        if sflag {
            print(sDist[x][y] + 1)
            break
        }
    }
    
    if !sflag {
        print("IMPOSSIBLE")
    }
}
