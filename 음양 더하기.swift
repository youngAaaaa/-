import Foundation

//처음
func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var ans = [Int](repeating: 0, count: absolutes.count)
    
    for i in 0..<absolutes.count{
        var num = absolutes[i]
        let flag = signs[i]
        ans[i] = !flag ? -num : num
    }

    return ans.reduce(0, +)
}

//두번째
func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    return (0..<absolutes.count).map{ signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
}
