import Foundation

func backtracking(_ depth: Int) {
    if depth == m {
        print(selected.map({ String($0) }).joined(separator: " "))
        return
    }
    for data in Set(input).sorted(by: <) {
        if dict[data]! > 0 {
            dict[data]! -= 1
            selected.append(data)
            backtracking(depth + 1)
            dict[data]! += 1
            selected.removeLast()
        }
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]

var dict = [Int:Int]()
var input = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: <)
for i in input {
    dict[i, default: 0] += 1
}

var selected = [Int]()
backtracking(0)
