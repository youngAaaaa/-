import Foundation

func solution(_ s:String) -> Int {
    var ans = "", str = ""
    let num = ["zero":0, "one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9]
    
    s.forEach { char in
        if char.isNumber{
            ans += String(char)
        } else {
            str += String(char)
            if let equal = num[str]{
                ans += String(equal)
                str = ""
            }
        }
    }
    
    return Int(ans)!
}
