import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var dict = [1:0, 2:0, 3:0]
    let one = [1, 2, 3, 4, 5]
    let two = [2, 1, 2, 3, 2, 4, 2, 5]
    let three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    answers.enumerated().forEach { (idx, element) in
        print(idx, element)
        if element == one[idx % 5] { dict[1]! += 1 }
        if element == two[idx % 8] { dict[2]! += 1 }
        if element == three[idx % 10] { dict[3]! += 1 }
    }
    
    let max = dict.values.max()!
    return dict.filter { $0.value == max }.sorted(by: <).map{ $0.key }
}
