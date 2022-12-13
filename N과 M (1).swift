import Foundation

func backtracking(_ depth: Int){
    if depth == m {
        for i in 0..<m {
            print(selected[i], terminator: "\n")
        }
        return
    }
    
    for i in 1...n {
        if !isUsed[i] {
            isUsed[i] = true
            selected[depth] = i
            backtracking(depth + 1)
            isUsed[i] = false
        }
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var selected = [Int](repeating: 0, count: 10)
var isUsed = [Bool](repeating: false, count: 10)

backtracking(0)
