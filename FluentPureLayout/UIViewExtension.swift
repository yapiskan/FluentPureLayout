//
//  UIViewExtension.swift
//  FluentPureLayout
//
//  Created by Ali Ersöz on 11/12/17.
//  Copyright © 2017 Ali Ersöz. All rights reserved.
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
    
    @discardableResult
    func left(_ inset: CGFloat) -> UIView {
        if self.leftConstraint == nil {
            self.leftConstraint = self.autoPinEdge(toSuperviewEdge: .leading, withInset: inset)
            self.leftConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func right(_ inset: CGFloat) -> UIView {
        if self.rightConstraint == nil {
            self.rightConstraint = self.autoPinEdge(toSuperviewEdge: .trailing, withInset: inset)
            self.rightConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func top(_ inset: CGFloat) -> UIView {
        if self.topConstraint == nil {
            self.topConstraint = self.autoPinEdge(toSuperviewEdge: .top, withInset: inset)
            self.topConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func bottom(_ inset: CGFloat) -> UIView {
        if self.bottomConstraint == nil {
            self.bottomConstraint = self.autoPinEdge(toSuperviewEdge: .bottom, withInset: inset)
            self.bottomConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> UIView {
        if self.widthConstraint == nil {
            self.widthConstraint = self.autoSetDimension(.width, toSize: width)
            self.widthConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> UIView {
        if self.heightConstraint == nil {
            self.heightConstraint = self.autoSetDimension(.height, toSize: height)
            self.heightConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func size(_ size: CGSize) -> UIView {
        return self.width(size.width).height(size.height)
    }
    
    @discardableResult
    func centeredOnX(offset: CGFloat = 0) -> UIView {
        if self.centerXConstraint == nil {
            self.centerXConstraint = self.autoAlignAxis(.vertical, toSameAxisOf: self.superview!, withOffset: offset)
            self.centerXConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func centeredOnY(offset: CGFloat = 0) -> UIView {
        if self.centerYConstraint == nil {
            self.centerYConstraint = self.autoAlignAxis(.horizontal, toSameAxisOf: self.superview!, withOffset: offset)
            self.centerYConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func sameX(view: UIView, offset: CGFloat = 0) -> UIView {
        if self.centerXConstraint == nil {
            self.centerXConstraint = self.autoAlignAxis(.vertical, toSameAxisOf: view, withOffset: offset)
            self.centerXConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func sameY(view: UIView, offset: CGFloat = 0) -> UIView {
        if self.centerYConstraint == nil {
            self.centerYConstraint = self.autoAlignAxis(.horizontal, toSameAxisOf: view, withOffset: offset)
            self.centerYConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func spread() -> UIView {
        return self.spread(vertical: true).spread(horizontal: true)
    }
    
    @discardableResult
    func spread(vertical: Bool) -> UIView {
        if vertical {
            self.top(0).bottom(0)
        }
        
        return self
    }
    
    @discardableResult
    func spread(horizontal: Bool) -> UIView {
        if horizontal {
            self.left(0).right(0)
        }
        
        return self
    }
    
    @discardableResult
    func spreadHorizontally() -> UIView {
        self.spread(horizontal: true)
        
        return self
    }
    
    @discardableResult
    func spreadVertically() -> UIView {
        self.spread(vertical: true)
        
        return self
    }
    
    @discardableResult
    func pinTo(view: UIView, top: CGFloat) -> UIView {
        if self.topConstraint == nil {
            self.topConstraint = self.autoPinEdge(.top, to: .bottom, of: view, withOffset: top)
            self.topConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func pinTo(view: UIView ,left: CGFloat) -> UIView {
        if self.leftConstraint == nil {
            self.leftConstraint = self.autoPinEdge(.leading, to: .trailing, of: view, withOffset: left)
            self.leftConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func pinTo(view: UIView, bottom: CGFloat = 0) -> UIView {
        if self.bottomConstraint == nil {
            self.bottomConstraint = self.autoPinEdge(.bottom, to: .top, of: view, withOffset: bottom)
            self.bottomConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func pinTo(view: UIView, right: CGFloat = 0) -> UIView {
        if self.rightConstraint == nil {
            self.rightConstraint = self.autoPinEdge(.trailing, to: .leading, of: view, withOffset: right)
            self.rightConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func alignTo(view: UIView, top: CGFloat = 0) -> UIView {
        if self.topConstraint == nil {
            self.topConstraint = self.autoPinEdge(.top, to: .top, of: view, withOffset: top)
            self.topConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func alignTo(view: UIView, left: CGFloat = 0) -> UIView {
        if self.leftConstraint == nil {
            self.leftConstraint = self.autoPinEdge(.leading, to: .leading, of: view, withOffset: left)
            self.leftConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func alignTo(view: UIView, bottom: CGFloat = 0) -> UIView {
        if self.bottomConstraint == nil {
            self.bottomConstraint = self.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: bottom)
            self.bottomConstraint?.identifier = self.variableName
        }
        
        return self
    }
    
    @discardableResult
    func alignTo(view: UIView, right: CGFloat = 0) -> UIView {
        if self.rightConstraint == nil {
            self.rightConstraint = self.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: right)
            self.rightConstraint?.identifier = self.variableName
        }
        
        return self
    }
}
