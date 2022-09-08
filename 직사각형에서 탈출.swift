import Foundation

let xywh = readLine()!.split(separator: " ").map({  Int(String($0))! })
let x = xywh[0]
let y = xywh[1]
let w = xywh[2]
let h = xywh[3]

let xtow = abs(w - x)
let ytoh = abs(h - y)

let minX = xtow < x ? xtow : x
let minY = ytoh < y ? ytoh : y

let minAns = minX < minY ? minX : minY

print(minAns)
