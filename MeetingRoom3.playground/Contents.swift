/*
 [2, 3, 6] -> 7
 [4, 1, 2] -> 0
 [3, 3, 8] -> 8
 */

import Foundation

//let input = [[2, 3, 6], [4, 1, 2], [3, 3, 8], [5,2,8], [3, 5, 11], [5, 5, 16], [5, 5, 20]]
//let input = [[5,2,8]]
//let input = [[4,3,7]] // -> 2
//let input = [[3,5,9]] // -> 3
//let input = [[3,5,11]] // -> 8
//let input = [[3,5,14]] // -> 18
//let input = [[3,3,6]] // -> 3
//let input = [[3,3,8]] // -> 8
//let input = [[5, 5, 16]]
//let input = [[5, 5, 20]] // -> 20
//let input = [[1,9,6]] // -> 2
//let input = [[1,16,9]] // -> 1
//let input = [[16,1,9]] // -> 1
//let input = [[1,13,9]] // -> 4

let input = [[5,2,8],[3,5,14],[1,16,1],[3,5,1],[8,2,12],[16,1,1],[3,3,6],[2,6,12],[15,1,0],[5,3,7],[4,3,5],[3,5,11],[7,2,13],[15,1,6],[15,1,15],[4,4,9],[5,3,8],[3,5,6],[16,1,7],[1,15,7],[4,3,12],[5,3,13],[2,4,5],[5,3,5],[16,1,16],[2,5,8],[5,3,4],[5,3,10],[4,4,7],[3,5,9],[4,2,2],[4,4,15],[2,2,4],[5,3,11],[4,4,8],[1,16,9],[4,4,16],[1,15,6],[15,1,8],[5,3,6],[16,1,9],[3,5,15],[1,15,1],[1,15,0],[2,5,9],[3,5,10],[1,15,15],[3,2,0],[5,3,2],[5,3,1],[5,2,4],[3,5,4],[2,7,13],[3,3,0],[7,2,11],[4,4,0],[1,1,0],[2,6,9],[3,5,3],[5,3,15],[5,2,6],[3,4,12],[2,3,6],[1,1,1],[15,1,1],[1,16,16],[2,2,2],[3,3,9],[16,1,8],[9,1,6],[5,3,12],[2,2,3],[3,5,7],[7,2,0],[4,3,6],[2,3,4],[1,15,8],[16,1,0],[5,3,9],[15,1,7],[2,4,6],[1,16,7],[3,5,12],[1,16,8],[4,4,1],[3,5,0],[3,5,8],[1,16,0],[5,3,3],[5,3,0],[1,13,9],[3,5,2],[1,9,6],[6,2,12],[4,3,8],[3,5,5],[5,3,14],[4,3,7],[6,2,4],[3,5,1]]

func print(row: Int, column: Int, num: Int, result: Int) {
    print("[" + String(row) + "," + String(column) + "," + String(num) + "]-> " + String(result))
}

for data in input {
    let totalRow = data[0]
    let totalColumn = data[1]
    let num = data[2]
    let totalCel = totalRow * totalColumn
    
    let totalBorder = (totalRow - 1) * totalColumn + (totalColumn - 1) * totalRow
    var noisyBorder = 0
    
//    print("\ntotalRow: " + String(totalRow))
//    print("totalColumn: " + String(totalColumn))
//    print("totalBorder: " + String(totalBorder))
    
    if (totalCel % 2 == 0) {
        if (num <= totalCel / 2) {
            //            print("[" + String(row) + "," + String(column) + "," + String(num) + "] -> " + "0")
            print(row: totalRow, column: totalColumn, num: num, result: 0)
            continue
        }
    } else {
        if (num <= (totalCel + 1) / 2) {
            //            print("[" + String(row) + "," + String(column) + "," + String(num) + "] -> " + "0")
            print(row: totalRow, column: totalColumn, num: num, result: 0)
            continue
        }
    }
    
    if (num == totalCel) {
        print(row: totalRow, column: totalColumn, num: num, result: totalBorder)
        continue
    }
    
    var blankCellCount = totalCel - num
    noisyBorder = totalBorder
    var result = 0
    var restCellCount = totalCel / 2

    if (totalRow % 2 == 1 && totalColumn % 2 == 1) {
//        var blankCellCount =
//        var surroundedBlankCellCount = ((totalRow - 2) * (totalColumn - 2)) / 2
        var surroundedBlankCellCount = ((totalRow - 2) * (totalColumn - 2))
        var d = num - (totalRow * totalColumn + 1) / 2

        surroundedBlankCellCount = surroundedBlankCellCount / 2
        
        if (totalRow == 1 || totalColumn == 1) {
            result = 2 * d
        } else {
            if (d < 3) {
                result = 3 * d
            } else if (d == 3) {
                result = 8
            } else if (d < restCellCount - surroundedBlankCellCount) {
                //            print("C")
                //            result = 3 * d
                result = 3 * d - 1
            } else {
                //            print("D")
                result = 4 * d - 6
            }
        }

//        print("num: " + String(num))
//        print("d: " + String(d))
//        print("blankCellCount : " + String(blankCellCount))
//        print("surroundedBlankCellCount : " + String(surroundedBlankCellCount))
//        print("restCellCount - surroundedBlankCellCount: " + String(restCellCount - surroundedBlankCellCount))
    } else {
        var surroundedBlankCellCount = ((totalRow - 2) * (totalColumn - 2)) / 2
        var d = num - (totalRow * totalColumn) / 2

        if (totalRow == 1 || totalColumn == 1) {
            result = 2 * (d - 1) + 1
        } else {
            if (d < 3) {
//                print("A")
                result = 2 * d
            } else if (d < restCellCount - surroundedBlankCellCount) {
//                print("B")
                result = 3 * d - 2
            } else {
//                print("C")
                result = 4 * d - 8
            }
        }

//        print("num: " + String(num))
//        print("d: " + String(d))
//        print("blankCellCount : " + String(blankCellCount))
//        print("surroundedBlankCellCount : " + String(surroundedBlankCellCount))
//        print("restCellCount - surroundedBlankCellCount: " + String(restCellCount - surroundedBlankCellCount))
    }
    
    print(row: totalRow, column: totalColumn, num: num, result: result)
}
