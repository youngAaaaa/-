import Foundation

let nm = readLine()!.split(separator: " ").map({ Int(String($0))! })
let n = nm[0], m = nm[1]
var dict = [String:String]()

for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map({ String($0) })
    dict[input[0]] = input[1]
}

for _ in  0..<m{
    let input = readLine()!
    if dict[input] != nil {
        print(dict[input]!)
    }
}
