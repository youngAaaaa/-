import Foundation

let mn = readLine()!.split(separator: " ").map({ Int(String($0))! })
let m = mn[0], n = mn[1]

var prime = [Int]()
var isPrime = [Bool](repeating: true, count: n + 1)

for i in 2...n{
    if isPrime[i], i >= m{
        prime.append(i)
    }
    for j in stride(from: i*2, through: n, by: +i){
        isPrime[j] = false
    }
}
prime.map({ print($0) })
