import Foundation

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]

var sum = [Int](repeating: 0, count: n+1)
let nums = readLine()!.split(separator: " ").map({ Int(String($0))! })

for i in 1...n{
    sum[i] = sum[i-1] + nums[i-1]
}

for _ in 0..<m{
    let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
    let i = input[0], j = input[1]
    print(sum[j] - sum[i-1])
}
