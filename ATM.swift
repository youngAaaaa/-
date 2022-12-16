import Foundation

let n = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted(by: <)

var sum = [Int](repeating: 0, count: n + 1)
sum[0] = people[0]
for i in 1..<people.count {
    sum[i] = sum[i - 1] + people[i]
}

print(sum.reduce(0, +))
