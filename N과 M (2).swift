import Foundation

func backtracking(_ depth: Int){
    if depth == m {
        if selected.sorted() == selected {
            print(selected.map{ String($0) }.joined(separator: " "))
        }
        return
    }
    
    for i in 1...n{
        if !isUsed[i] {
            isUsed[i] = true
            selected.append(i)
            backtracking(depth + 1)
            isUsed[i] = false
            selected.removeLast()
        }
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var selected = [Int]()
var isUsed = [Bool](repeating: false, count: n + 1)

backtracking(0)
