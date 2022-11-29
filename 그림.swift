//
//  main.swift
//  algorithm
//
//  Created by 안다영 on 2022/11/29.
//

import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs(_ x: Int, _ y: Int) -> Int{
    var queue = [(x, y)]
    visited[x][y] = true
    var sum = 1
    
    while !queue.isEmpty {
        let (i , j) = queue.removeFirst()
        for k in 0..<4 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
            if paint[nx][ny] == 1, !visited[nx][ny] {
                queue.append((nx, ny))
                visited[nx][ny] = true
                sum += 1
            }
        }
    }
    
    return sum
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var paint = [[Int]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m + 1), count: n + 1)
var ans = 0, mx = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    paint.append(input)
}


for i in 0..<n {
    for j in 0..<m {
        if paint[i][j] == 1, !visited[i][j] {
            ans += 1
            mx = max(mx, bfs(i, j))
        }
    }
}

print(ans, mx, separator: "\n")
