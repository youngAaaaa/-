import Foundation


let n = Int(readLine()!)!
var ropes = [Int]()
var ans = 0

for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}

ropes.sort(by: >)

for i in 0..<n {
    ans = max(ans, ropes[i] * (i + 1))
}

print(ans)
