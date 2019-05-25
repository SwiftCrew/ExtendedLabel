//
//  ExtendedLabel.swift
//  ExtendedLabel
//
//  Created by Mohammmad Tahir on 25/05/19.
//  Copyright © 2019 Mohammad Tahir. All rights reserved.
//

import UIKit

@IBDesignable
public class ExtendedLabel: UILabel {
  
  var textInsets = UIEdgeInsets.zero {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }
  
  override public func drawText(in rect: CGRect) {
    self.setNeedsLayout()
    super.drawText(in: rect.inset(by: self.textInsets))
  }
}

extension ExtendedLabel {
  
  @IBInspectable
  var rotation: Int {
    get {
      return 0
    } set {
      self.rotate(degrees: newValue)
    }
  }
  
  private func rotate(degrees: Int) {
    
    rotate(radians: CGFloat.pi * CGFloat(degrees) / 180.0)
  }
  
  private func rotate(radians: CGFloat) {
    
    self.transform = CGAffineTransform(rotationAngle: radians)
  }
  
  @IBInspectable
  var leftTextInset: CGFloat {
    set { self.textInsets.left = newValue }
    get { return self.textInsets.left }
  }
  
  @IBInspectable
  var rightTextInset: CGFloat {
    set { self.textInsets.right = newValue }
    get { return self.textInsets.right }
  }
  
  @IBInspectable
  var topTextInset: CGFloat {
    set { self.textInsets.top = newValue }
    get { return self.textInsets.top }
  }
  
  @IBInspectable
  var bottomTextInset: CGFloat {
    set { self.textInsets.bottom = newValue }
    get { return self.textInsets.bottom }
  }
}
