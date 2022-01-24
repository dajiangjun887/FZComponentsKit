//
//  UIView+Extension.swift
//  Dicos
//
//  Created by Jack on 2021/8/11.
//

import UIKit

/// xib类继承该协议
protocol NibLoadable { }
extension NibLoadable where Self : UIView {
    // 在协议里面不允许定义class 只能定义static
    // Self (大写) 当前类对象
    static func loadFromNib(_ nibname: String? = nil) -> Self {
        // self(小写) 当前对象
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}

extension UIView {
    
    // 设置圆角
    public func fz_SetCornersRadius(radius: CGFloat, roundingCorners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        maskLayer.shouldRasterize = true
        maskLayer.rasterizationScale = UIScreen.main.scale
        self.layer.mask = maskLayer
    }
    
    // 设置圆角和阴影
    public func fz_SetShadowWithCornerRadius(cornerRadius: CGFloat, shadowColor: UIColor, shadowOffset: CGSize = .zero, shadowOpacity: Float = 1, shadowRadius: CGFloat) {
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
}
