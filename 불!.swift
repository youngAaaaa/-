//
//  main.swift
//  algorithm
//
//  Created by 안다영 on 2022/11/29.
//

import Foundation

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var queue_F = [(Int, Int)]()
var queue_J = [(Int, Int)]()
let rc = readLine()!.split(separator: " ").map({ Int(String($0))! })
let r = rc[0], c = rc[1]
var maze = [[String]]()
var dist_F = [[Int]](repeating: [Int](repeating: -1, count: c + 1), count: r + 1)
var dist_J = [[Int]](repeating: [Int](repeating: -1, count: c + 1), count: r + 1)

for i in 0..<r {
    let input = readLine()!.map({ String($0) })
    maze.append(input)
    for j in 0..<c {
        if input[j] == "F" {
            queue_F.append((i, j))
            dist_F[i][j] = 0
        }
        if input[j] == "J" {
            queue_J.append((i, j))
            dist_J[i][j] = 0
        }
    }
}
var index = 0

while index < queue_F.count {
    let (x, y) = (queue_F[index].0, queue_F[index].1)
    index += 1
    
    for k in 0..<4 {
        let nx = x + dx[k]
        let ny = y + dy[k]
        if nx < 0 || nx >= r || ny < 0 || ny >= c { continue }
        if maze[nx][ny] == "#" || dist_F[nx][ny] >= 0 { continue }
        dist_F[nx][ny] = dist_F[x][y] + 1
        queue_F.append((nx, ny))
    }
}

index = 0

while index < queue_J.count {
    let (x, y) = (queue_J[index].0, queue_J[index].1)
    index += 1
    
    for k in 0..<4 {
        let nx = x + dx[k]
        let ny = y + dy[k]
        if nx < 0 || nx >= r || ny < 0 || ny >= c {
            print(dist_J[x][y] + 1)
            exit(0)
        }
        if maze[nx][ny] == "#" || dist_J[nx][ny] >= 0 { continue }
        if dist_F[nx][ny] != -1 , dist_F[nx][ny] <= dist_J[x][y] + 1 { continue }
        dist_J[nx][ny] = dist_J[x][y] + 1
        queue_J.append((nx, ny))
    }
}

print("IMPOSSIBLE")
