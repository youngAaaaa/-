import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = [Int]()
    let len = a.count
    
    for i in 0..<len{
        let multi = a[i] * b[i]
        sum.append(multi)
    }
    
    return sum.reduce(0, +)
}
