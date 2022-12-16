import Foundation

let n = Int(readLine()!)!

let arrA = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: <)
let arrB = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: >)

var ans = 0
for i in 0..<n {
    ans += arrA[i] * arrB[i]
}

print(ans)
