import Foundation

func backtracking(_ sum: Int, _ depth: Int) {
    if depth == n {
        if sum == s {
            cnt += 1
        }
        return
    }
    
    backtracking(sum, depth + 1)
    backtracking(sum + input[depth], depth + 1)
}

let ns = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = ns[0], s = ns[1]

var cnt = 0
var isUsed = [Bool](repeating: false, count: n + 1)
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })

backtracking(0, 0)

if s == 0 { cnt -= 1 }
print(cnt)
