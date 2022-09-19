import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let tmpQueue = queue1 + queue2
    var sum1 = queue1.reduce(0, +), sum2 = queue2.reduce(0, +)
    let halfTotal = (sum1 + sum2) / 2
    var left = 0, right = queue1.count, ans = 0
    
    if (sum1 + sum2) % 2 != 0{
        return -1
    }
    if halfTotal < queue1.max()! || halfTotal < queue2.max()!{
        return -1
    }
    while right < tmpQueue.count && left <= right{
        if sum1 < halfTotal{
            sum1 += tmpQueue[right]
            right += 1
        }
        else if sum1 > halfTotal {
            sum1 -= tmpQueue[left]
            left += 1
        }
        else{
            break
        }
        ans += 1
    }
    if sum1 != halfTotal{
        return -1
    }
    return ans
}

print(solution([3, 2, 7, 2], [4, 6, 5, 1]))
print(solution([1, 2, 1, 2], [1, 10, 1, 2]))
print(solution([1, 1], [1, 5]))
