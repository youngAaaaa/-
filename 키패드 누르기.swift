import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var ans = ""
    var left = 10
    var right = 12
    
    for i in numbers{
        let num = i == 0 ? 11 : i
        if num == 1 || num == 4 || num == 7{
            left = num
            ans += "L"
        }
        else if num == 3 || num == 6 || num == 9{
            right = num
            ans += "R"
        }
        else{
            let ltmp = abs(left - num)
            let rtmp = abs(right - num)
            let leftToMiddle = (ltmp / 3) + (ltmp % 3)
            let rightToMiddle = (rtmp / 3) + (rtmp % 3)
            
            if leftToMiddle == rightToMiddle{
                if(hand == "left"){
                    left = num
                    ans += "L"
                } else {
                    right = num
                    ans += "R"
                }
            } else if leftToMiddle < rightToMiddle{
                ans += "L"
                left = num
            } else {
                right = num
                ans += "R"
            }
        }
    }
    return ans
}


print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right"))
