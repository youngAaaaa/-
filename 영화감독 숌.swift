import Foundation

let n = Int(readLine()!)!

var cnt = 0
var num = 666

while(true){
    var cntSix = 0
    var value = num
    while(value > 0){
        if value % 10 == 6{
            cntSix += 1
        }
        else { cntSix = 0 }
        
        if cntSix == 3{
            cnt += 1
            break
        }
        value /= 10
    }
    if cnt == n { break }
    num += 1
}

print(num)
