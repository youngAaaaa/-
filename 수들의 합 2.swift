import Foundation

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map({ Int(String($0))! })

var sum = 0
var cnt = 0
var left = 0, right = 0

while true{
    if sum >= m {
        sum -= nums[left]
        left += 1
    }
    else if right == n{
        break
    }
    else {
        sum += nums[right]
        right += 1
    }
    if sum == m {
        cnt += 1
    }
}

print(cnt)

