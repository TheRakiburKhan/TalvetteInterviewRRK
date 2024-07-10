import Foundation

public struct TextJustification {
    public static func fullJustify(_ words: [String], maxWidth: Int) -> [String] {
        var res: [String] = []
        var i = 0
        var k: Int
        var l: Int
        while i < words.count {
            k = 0
            l = 0
            
            while i + k < words.count && l + words[i+k].count <= maxWidth - k {
                l += words[i+k].count
                k += 1
            }
            
            var tmp = words[i]
            
            for j in 0 ..< k-1 {
                if i + k >= words.count {
                    tmp += " "
                } else {
                    var tmpLen = (maxWidth - l) / (k - 1)
                    let tmpBool = j < (maxWidth - l) % (k - 1)
                    
                    if tmpBool {
                        tmpLen += 1
                    }
                    
                    let tmpArr: [Character] = Array(repeating: " ", count: tmpLen)
                    tmp += String(tmpArr)
                }
                
                tmp += words[i+j+1]
            }
            
            let charArrLen = maxWidth - tmp.count
            let charArr: [Character] = Array(repeating: " ", count: charArrLen)
            tmp += String(charArr)
            res.append(tmp)
            i += k
        }
        
        return res
    }
}
