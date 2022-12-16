import Foundation

let n = Int(readLine()!)!
var flower = [(Int,Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    flower.append((input[0] * 100 + input[1], input[2] * 100 + input[3]))
}

var ans = 0
var time = 301
while time < 1201 {
    var next = time
    for i in 0..<n {
        if flower[i].0 <= time, next < flower[i].1   {
            next = flower[i].1
        }
    }
    if next == time {
        print(0)
        exit(0)
    }
    ans += 1
    time = next
}

print(ans)
