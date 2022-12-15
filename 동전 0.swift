import Foundation

let nk = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nk[0]
var k = nk[1]
var coins = [Int]()

for _ in 0..<n {
    coins.append( Int(readLine()!)! )
}

var cnt = 0
for coin in stride(from: coins.count-1, through: 0, by: -1) {
    cnt += k / coins[coin]
    k %= coins[coin]
}

print(cnt)
