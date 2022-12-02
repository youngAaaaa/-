import Foundation

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

func bfs(_ x: Int, _ y: Int, _ target: String, _ array: [[String]]) {
    var queue = [(x, y)]
    visited[x][y] = true
    
    var index = 0
    while index < queue.count {
        let (i, j) = (queue[index].0, queue[index].1)
        index += 1
        
        for k in 0..<4 {
            let nx = dx[k] + i
            let ny = dy[k] + j
            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
            if array[nx][ny] != target || visited[nx][ny] { continue }
            queue.append((nx, ny))
            visited[nx][ny] = true
        }
    }
}

let n = Int(readLine()!)!
var boardRGB = [[String]]()
var boardRB = [[String]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)

for _ in 0..<n {
    let input = readLine()!.map({ String($0) })
    
    boardRGB.append(input)
    
    if input.contains("G"){
        var tmpInput = ""
        for i in 0..<input.count {
            if input[i] == "G" {
                tmpInput += "R"
            }
            else { tmpInput += input[i] }
        }
        boardRB.append(tmpInput.map({ String($0) }))
    }
    else {
        boardRB.append(input)
    }
}

var R = 0, G = 0, B = 0, RG = 0
for i in 0..<n {
    for j in 0..<n {
        if boardRGB[i][j] == "R", !visited[i][j] {
            R += 1
            bfs(i, j, boardRGB[i][j], boardRGB)
        }
        if boardRGB[i][j] == "G", !visited[i][j] {
            G += 1
            bfs(i, j, boardRGB[i][j], boardRGB)
        }
        if boardRGB[i][j] == "B", !visited[i][j] {
            B += 1
            bfs(i, j, boardRGB[i][j], boardRGB)
        }
    }
}

visited = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)

for i in 0..<n {
    for j in 0..<n {
        if boardRB[i][j] == "R", !visited[i][j] {
            RG += 1
            bfs(i, j, boardRB[i][j], boardRB)
        }
    }
}

print(R+G+B, RG+B)
