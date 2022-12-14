import Foundation

func backtracking(_ depth: Int){
    if depth == m {
        ans += selected.map{ String($0) }.joined(separator: " ")
        ans += "\n"
        return
    }
    
    for i in 1...n{
        selected.append(i)
        backtracking(depth + 1)
        selected.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var selected = [Int]()
var ans = ""

backtracking(0)
print(ans)
