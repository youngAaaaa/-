import Foundation

func solution(_ s:String) -> Bool
{
    let p:[Character] = ["P", "p"]
    let y:[Character] = ["Y", "y"]
    
    var pCount = 0
    var yCount = 0
    
    for i in s.indices{
        let str: Character = s[i]
        if p.contains(str){
            pCount += 1
        }
        if y.contains(str){
            yCount += 1
        }
    }

    return pCount == yCount ? true : false
}
