//
//  AutoLayoutHelper.swift
//  Helper
//
//  Created by Ali Ersöz on 6/6/16.
//  Copyright © 2016 Ali Ersoz. All rights reserved.
//

import Foundation
import PureLayout

private struct AssociatedKeys {
    static var LeftConstraint = "leftConstraint"
    static var RightConstraint = "rightConstraint"
    static var TopConstraint = "topConstraint"
    static var BottomConstraint = "bottomConstraint"
    static var HeightConstraint = "heightConstraint"
    static var WidthConstraint = "widthConstraint"
    static var CenterXConstraint = "centerXConstraint"
    static var CenterYConstraint = "centerYConstraint"
    static var VariableName = "variableName"
}

extension UIView {
    var leftConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.LeftConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.LeftConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var rightConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.RightConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.RightConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var topConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.TopConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.TopConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var bottomConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.BottomConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.BottomConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.HeightConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.HeightConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var widthConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.WidthConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.WidthConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var centerXConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.CenterXConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.CenterXConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var centerYConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.CenterYConstraint) as? NSLayoutConstraint
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.CenterYConstraint, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var variableName: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.VariableName) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.VariableName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func left(inset: CGFloat) -> UIView {
        if (self.leftConstraint == nil) {
            self.leftConstraint = self.autoPinEdgeToSuperviewEdge(.Leading, withInset: inset)
            self.leftConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func right(inset: CGFloat) -> UIView {
        if (self.rightConstraint == nil) {
            self.rightConstraint = self.autoPinEdgeToSuperviewEdge(.Trailing, withInset: inset)
            self.rightConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func top(inset: CGFloat) -> UIView {
        if (self.topConstraint == nil) {
            self.topConstraint = self.autoPinEdgeToSuperviewEdge(.Top, withInset: inset)
            self.topConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func bottom(inset: CGFloat) -> UIView {
        if (self.bottomConstraint == nil) {
            self.bottomConstraint = self.autoPinEdgeToSuperviewEdge(.Bottom, withInset: inset)
            self.bottomConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func width(width: CGFloat) -> UIView {
        if (self.widthConstraint == nil) {
            self.widthConstraint = self.autoSetDimension(.Width, toSize: width)
            self.widthConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func size(size: CGSize) -> UIView {
        self.width(size.width).height(size.height)
        
        return self
    }

    func height(height: CGFloat) -> UIView {
        if (self.heightConstraint == nil) {
            self.heightConstraint = self.autoSetDimension(.Height, toSize: height)
            self.heightConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func centeredOnX(offset: CGFloat = 0) -> UIView {
        if (self.centerXConstraint == nil) {
            self.centerXConstraint = self.autoAlignAxis(.Vertical, toSameAxisOfView: self.superview!, withOffset: offset)
            self.centerXConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func centeredOnY(offset: CGFloat = 0) -> UIView {
        if (self.centerYConstraint == nil) {
            self.centerYConstraint = self.autoAlignAxis(.Horizontal, toSameAxisOfView: self.superview!, withOffset: offset)
            self.centerYConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func sameX(view: UIView, offset: CGFloat = 0) -> UIView {
        if (self.centerXConstraint == nil) {
            self.centerXConstraint = self.autoAlignAxis(.Vertical, toSameAxisOfView: view, withOffset: offset)
            self.centerXConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func sameY(view: UIView, offset: CGFloat = 0) -> UIView {
        if (self.centerYConstraint == nil) {
            self.centerYConstraint = self.autoAlignAxis(.Horizontal, toSameAxisOfView: view, withOffset: offset)
            self.centerYConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func spread() -> UIView {
        self.spread(vertical: true).spread(horizontal: true)
        
        return self
    }
    
    func spread(vertical vertical: Bool) -> UIView {
        if vertical {
            self.top(0).bottom(0)
        }
        
        return self
    }
    
    func spread(horizontal horizontal: Bool) -> UIView {
        if horizontal {
            self.left(0).right(0)
        }
        
        return self
    }
    
    func spreadHorizontally() -> UIView {
        self.spread(horizontal: true)
        
        return self
    }
    
    func spreadVertically() -> UIView {
        self.spread(vertical: true)
        
        return self
    }
    
    func pinTo(view: UIView, top: CGFloat) -> UIView {
        if self.topConstraint == nil {
            self.topConstraint = self.autoPinEdge(.Top, toEdge: .Bottom, ofView: view, withOffset: top)
            self.topConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func pinTo(view: UIView ,left: CGFloat) -> UIView {
        if self.leftConstraint == nil {
            self.leftConstraint = self.autoPinEdge(.Leading, toEdge: .Trailing, ofView: view, withOffset: left)
            self.leftConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func pinTo(view: UIView, bottom: CGFloat = 0) -> UIView {
        if self.bottomConstraint == nil {
            self.bottomConstraint = self.autoPinEdge(.Bottom, toEdge: .Top, ofView: view, withOffset: bottom)
            self.bottomConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func pinTo(view: UIView, right: CGFloat = 0) -> UIView {
        if self.rightConstraint == nil {
            self.rightConstraint = self.autoPinEdge(.Trailing, toEdge: .Leading, ofView: view, withOffset: right)
            self.rightConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func alignTo(view: UIView, top: CGFloat = 0) -> UIView {
        if self.topConstraint == nil {
            self.topConstraint = self.autoPinEdge(.Top, toEdge: .Top, ofView: view, withOffset: top)
            self.topConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func alignTo(view: UIView, left: CGFloat = 0) -> UIView {
        if self.leftConstraint == nil {
            self.leftConstraint = self.autoPinEdge(.Leading, toEdge: .Leading, ofView: view, withOffset: left)
            self.leftConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func alignTo(view: UIView, bottom: CGFloat = 0) -> UIView {
        if self.bottomConstraint == nil {
            self.bottomConstraint = self.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: view, withOffset: bottom)
            self.bottomConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    func alignTo(view: UIView, right: CGFloat = 0) -> UIView {
        if self.rightConstraint == nil {
            self.rightConstraint = self.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: view, withOffset: right)
            self.rightConstraint?.identifier = self.variableName
        }
        
        return self
    }
}
