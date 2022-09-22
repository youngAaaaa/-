import Foundation

var str = readLine()!
let boom = readLine()!
var stack = [Character]()

str.forEach { char in
    stack.append(char)
    if char == boom.last!{
        let boomlen = boom.count
        let stacklen = stack.count
        if stacklen >= boomlen, String(stack[(stacklen-boomlen)...stacklen-1]) == boom{
            for _ in 0..<boomlen{
                stack.removeLast()
            }
        }
    }
}

if stack.isEmpty{
    print("FRULA")
} else { print(String(stack)) }
