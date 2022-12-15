import Foundation

let n = Int(readLine()!)!
var tuple = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    tuple.append((input[0], input[1]))
}

tuple.sort(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 })

var start = -1
var cnt = 0
for i in tuple {
    if start <= i.0 {
        start = i.1
        cnt += 1
    }
}

print(cnt)
