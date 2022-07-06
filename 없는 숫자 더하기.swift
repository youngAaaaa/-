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


print(solution([1,2,3,4,6,7,8,0]))
print(solution([5,8,4,0,6,7,9]))
