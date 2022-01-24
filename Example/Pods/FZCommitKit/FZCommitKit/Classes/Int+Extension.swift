//
//  Int+Extension.swift
//  FZCommitKit
//
//  Created by Jack on 2022/1/20.
//

import Foundation

public extension Int {
    
    /// 转换成价格
    var priceStr: String {
        // 小于0的情况下返回0展示
        guard self >= 0 else { return "0" }
        
        if self % 10 > 0 {
            //结果需要保留2位小数
            let str = String(format: "%.2f", CGFloat(self) / 100.0)
            return str
        }
        
        if self % 100 > 0 {
            //结果保留一位小数
            let str = String(format: "%.1f", CGFloat(self) / 100.0)
            return str
        }

        return String(format: "%.f", CGFloat(self) / 100.0)
    }
    
//    var price: CGFloat {
//        return self.priceStr.cgFloat() ?? 0
//    }
    
    
    /// 转换万的单位
    /// - Parameter scale: 小数点后舍入值的位数，默认 1 位
    /// - Returns: 返回万的字符串
    func fz_ToTenThousandString(scale: Int = 1) -> String {
        if self < 0 {
            return "0"
        } else if self <= 9999 {
            return "\(self)"
        } else {
            let doub = CGFloat(self) / 10000
            let str = String(format: "%.\(scale)f", doub)
           let start_index = str.index(str.endIndex, offsetBy: -1)
            let suffix = String(str[start_index ..< str.endIndex])
            if suffix == "0" {
                let toIndex = str.index(str.endIndex, offsetBy: -2)
                return String(str[str.startIndex ..< toIndex]) + "万"
            } else {
                return str + "万"
            }
        }
    }
}
