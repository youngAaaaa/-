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
