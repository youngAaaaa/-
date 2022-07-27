import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    
    for i in left...right{
        var num = 1
        var cnt = 0
        while(num <= i){
            if i % num == 0{
                cnt += 1
            }
            num += 1
        }
        if cnt % 2 == 0{
            result += i
        } else { result -= i }
    }
    
    return result
}
