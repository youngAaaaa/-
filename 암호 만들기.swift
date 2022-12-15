import Foundation

func dfs(_ depth: Int) {
    if depth == l {
        var cntAeiou = 0
        var cntConsonant = 0
        
        for select in selected {
            if aeiou.contains(select) {
                cntAeiou += 1
            }
            else {
                cntConsonant += 1
            }
        }
        
        if cntAeiou >= 1, cntConsonant >= 2 { print(selected.joined(separator: "")) }
        return
    }
    
    for data in input {
        if !selected.contains(data), selected.last ?? "" <= data {
            selected.append(data)
            dfs(depth + 1)
            selected.removeLast()
        }
    }
}

let lc = readLine()!.split(separator: " ").map({ Int(String($0))! })
let l = lc[0], c = lc[1]

var selected = [String]()
var isUsed = [Bool](repeating: false, count: c)
let input = readLine()!.split(separator: " ").map({ String($0) }).sorted(by: <)
let aeiou = ["a", "e", "i", "o", "u"]

dfs(0)

