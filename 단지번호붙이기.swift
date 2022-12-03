// 221203 제출-2	79516KB	20ms
import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs(_ x: Int, _ y: Int) -> Int {
    var queue = [(x, y)]
    visited[x][y] = true
    
    var index = 0
    var ans = 1
    while index < queue.count {
        let (i, j) = (queue[index].0, queue[index].1)
        index += 1
        
        for k in 0..<4 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue }
            if map[nx][ny] == 0 || visited[nx][ny] { continue }
            
            visited[nx][ny] = true
            queue.append((nx, ny))
            ans += 1
        }
    }
    
    return ans
}

let n = Int(readLine()!)!
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

var map = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.map({ Int(String($0))! })
    map.append(input)
}

var ans = [Int]()
for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1, !visited[i][j]{
            let num = bfs(i, j)
            ans.append(num)
        }
    }
}

print(ans.count)
ans.sorted().forEach({ print($0) })



// 220921 제출-1	79520KB	12ms
import Foundation

let di = [1, -1, 0, 0]
let dj = [0, 0, -1, 1]

func dfs(_ i: Int, _ j: Int){
    if visited[i][j]{
        return
    }
    else{
        visited[i][j] = true
        result += 1
        for k in 0..<4{
            let ni = i + di[k]
            let nj = j + dj[k]
            if ni < 0 || nj < 0 || ni >= n || nj >= n { continue }
            if map[ni][nj] == 1{
                dfs(ni, nj)
            }
        }
    }
}

var ans = [Int]()
var result = 0
let n = Int(readLine()!)!
var map = [[Int]](repeating: [], count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
for i in 0..<n{
    let input = readLine()!.map({ Int(String($0))! })
    map[i].append(contentsOf: input)
}

for i in 0..<n{
    for j in 0..<n{
        if !visited[i][j], map[i][j] == 1{
            result = 0
            dfs(i, j)
            ans.append(result)
        }
    }
}

ans.sort()
print(ans.count)
for i in 0..<ans.count{
    print(ans[i])
}
