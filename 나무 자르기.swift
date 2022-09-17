import Foundation

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
let length = readLine()!.split(separator: " ").map({ Int(String($0))! })

var start = 1, end = length.max()!

while(start <= end){
    let mid = (start + end) / 2
    var total = 0
    for i in length{
        if i > mid {
           total += i - mid
        }
    }
    if total >= m {
        start = mid + 1
    }
    else {
        end = mid - 1
    }
}

print(end)
