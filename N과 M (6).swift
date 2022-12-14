import Foundation

func backtracking(_ depth: Int){
    if depth == m {
        print(selected.map({ String($0) }).joined(separator: " "))
        return
    }
    
    for data in input {
        if !selected.contains(data), selected.last ?? 0 <= data {
            selected.append(data)
            backtracking(depth + 1)
            selected.removeLast()
        }
    }
}

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]

let input = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: <)
var selected = [Int]()

backtracking(0)
