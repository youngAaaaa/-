import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var ans:[Int] = []
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            let sum = numbers[i] + numbers[j]
            if(!ans.contains(sum)){
                ans.append(sum)
            }
        }
    }
    
    return ans.sorted()
}
