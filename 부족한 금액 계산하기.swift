import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    
    var sum = 0
    
    for i in 1...count{
        sum += price * i
    }
    
    return sum < money ? 0 : Int64(abs(money - sum))
}
