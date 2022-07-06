import Foundation

func solution(_ numbers:[Int]) -> Int {
    var ans = 0
    var check = [Int](repeating: 0, count: 10)
    
    for i in numbers{
        check[i] = 1
    }
    
    for i in 0...9{
        if check[i] == 0{
            ans += i
        }
    }
    
    return ans
}
