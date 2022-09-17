import Foundation

var member = [(index: Int, age: Int, name: String)]()
let n = Int(readLine()!)!

for i in 0..<n{
    let input = readLine()!.split(separator: " ").map({ String($0) })
    member.append((index: i, age: Int(input[0])!, name: input[1]))
}

for person in member.sorted(by: {$0.age == $1.age ? $0.index < $1.index : $0.age < $1.age}){
    print(person.age, person.name)
}

