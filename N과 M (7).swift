import Foundation

func backtracking(_ depth: Int) {
    if depth == m {
        ans += selected.joined(separator: " ") + "\n"
        return
    }
    
    for data in input {
        selected.append("\(data)")
        backtracking(depth + 1)
        selected.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var selected = [String]()
var ans = ""

let input = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: <)

backtracking(0)
print(ans)
