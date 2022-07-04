import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var ans = [Int]()
    let grade = [6, 6, 5, 4, 3, 2, 1]

    let zero = lottos.filter { $0 == 0 }.count
    let equal = lottos.filter{win_nums.contains($0)}.count

    ans = [grade[zero + equal], grade[equal]]
    
    return ans
}
