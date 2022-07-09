import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans = [Int]()
    
    commands.enumerated().forEach({ //idx, element
        let element = $0.1
        let start = element[0] - 1
        let end = element[1] - 1
        let pick = element[2] - 1
        
        let selected = array[start...end].sorted()
        ans.append(selected[pick])
    })
    return ans
}
