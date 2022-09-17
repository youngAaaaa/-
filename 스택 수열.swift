import Foundation

let n = Int(readLine()!)!
var stack = [Int]()

var i = 1
var ans = ""
for _ in 0..<n{
    let input = Int(readLine()!)!
    while(i <= input){
        stack.append(i)
        ans += "+"
        i += 1
    }
    if stack.last == input{
        stack.removeLast()
        ans += "-"
    }
    else {
        print("NO")
        exit(0)
    }
}

ans.map {print($0, terminator: "\n")}
