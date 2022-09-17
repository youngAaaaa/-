import Foundation

let kn = readLine()!.split(separator: " ").map({ Int(String($0))! })
let k = kn[0], n = kn[1]

var line = [Int]()
for _ in 0..<k{
    let input = Int(readLine()!)!
    line.append(input)
}

var start = 1
var end = line.max()!

while(start <= end){
    var result = 0
    let mid = (start + end) / 2
    for i in line{
        result += i / mid
    }
    if result < n{
        end = mid - 1
    }
    else {
        start = mid + 1
    }
}

print(end)
