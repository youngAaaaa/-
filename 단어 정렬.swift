import Foundation

var n = Int(readLine()!)!
var words = [String]()

for _ in 1...n{
    let input = readLine()!
    words.append(input)
}

words = Set(words).sorted(by: <).sorted(by: {$0.count < $1.count})
for i in words{
    print(i)
}
