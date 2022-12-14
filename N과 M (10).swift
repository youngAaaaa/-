import Foundation

func backtracking(_ depth: Int){
    if depth == m {
        print(selected.map({ String($0) }).joined(separator: " "))
        return
    }
    
    for data in Set(input).sorted(by: <) {
        if selected.last ?? 0 <= data, dict[data]! > 0 {
            selected.append(data)
            dict[data]! -= 1
            backtracking(depth + 1)
            dict[data]! += 1
            selected.removeLast()
        }
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var selected = [Int]()
var dict = [Int:Int]()

let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
for i in input {
    dict[i, default: 0] += 1
}

backtracking(0)
