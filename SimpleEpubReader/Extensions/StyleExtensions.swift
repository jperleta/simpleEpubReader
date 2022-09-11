// A set of convenience methods that lets you set object properties with chaining
//
//  e.g. Usage
//  lblTitle = UILabel()
//     .style(numberOfLines: 0)
//     .style(parent: view)

import UIKit
import SnapKit

extension UIView
{
    @discardableResult public func styleMakeConstraints(_ closure: (_ make: SnapKit.ConstraintMaker) -> Void) -> Self
    {
        snp.makeConstraints(closure)
        return self
    }
}

extension UIView
{
    /**
     Adds self as a subview of parent: UIView
     
     Method will call parent.addSubview(self). If parent is a UIStackView it will call stackView.addArrangedSubview(self)
     */
    @discardableResult public func style(parent: UIView) -> Self
    {
        if let stackView = parent as? UIStackView
        {
            stackView.addArrangedSubview(self)
        } else
        {
            parent.addSubview(self)
        }
        return self
    }
    
    @discardableResult public func style(backgroundColor: UIColor?) -> Self
    {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult public func style(contentMode: UIView.ContentMode) -> Self
    {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult public func style(contentHuggingPriority: UILayoutPriority, forAxis axis: NSLayoutConstraint.Axis) -> Self
    {
        setContentHuggingPriority(contentHuggingPriority, for: axis)
        return self
    }
    
    @discardableResult public func style(contentCompressionResistancePriority: UILayoutPriority, forAxis axis: NSLayoutConstraint.Axis) -> Self
    {
        setContentCompressionResistancePriority(contentCompressionResistancePriority, for: axis)
        return self
    }
    
    @discardableResult public func style(gestureRecognizer: UIGestureRecognizer) -> Self
    {
        addGestureRecognizer(gestureRecognizer)
        return self
    }
    
    @discardableResult public func style(hidden: Bool) -> Self
    {
        if self.isHidden != hidden
        {
            self.isHidden = hidden
        }
        return self
    }
    
    @discardableResult public func style(tag: Int) -> Self
    {
        self.tag = tag
        return self
    }
    
    @discardableResult public func styler(tintColor: UIColor) -> Self
    {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult public func style(userInteractionEnabled: Bool) -> Self
    {
        self.isUserInteractionEnabled = userInteractionEnabled
        return self
    }
    
    @discardableResult public func style(alpha: CGFloat) -> Self
    {
        self.alpha = alpha
        return self
    }
    
    @discardableResult public func style(isOpaque: Bool) -> Self
    {
        self.isOpaque = isOpaque
        return self
    }
    
    @discardableResult public func style(center: CGPoint) -> Self
    {
        self.center = center
        return self
    }
    
    @discardableResult public func style(frame: CGRect) -> Self
    {
        self.frame = frame
        return self
    }
    
    @discardableResult public func style(bounds: CGRect) -> Self
    {
        self.bounds = bounds
        return self
    }
    
    @discardableResult public func style(layoutMargins: UIEdgeInsets) -> Self
    {
        self.layoutMargins = layoutMargins
        return self
    }
    
    @discardableResult public func style(clipsToBounds: Bool) -> Self
    {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult public func style(translatesAutoresizingMaskIntoConstraints: Bool) -> Self
    {
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return self
    }
}

extension CALayer
{
    @discardableResult public func style(radius: CGFloat) -> Self
    {
        self.cornerRadius = radius
        return self
    }
    
    @discardableResult public func style(borderWidth: CGFloat, color: UIColor) -> Self
    {
        self.borderWidth = borderWidth
        self.borderColor = color.cgColor
        return self
    }
}

extension UIStackView
{
    @discardableResult public func style(spacing: CGFloat) -> Self
    {
        self.spacing = spacing
        return self
    }
    
    @discardableResult public func style(axis: NSLayoutConstraint.Axis) -> Self
    {
        self.axis = axis
        return self
    }
    
    @discardableResult public func style(alignment: UIStackView.Alignment) -> Self
    {
        self.alignment = alignment
        return self
    }
    
    @discardableResult public func style(distribution: UIStackView.Distribution) -> Self
    {
        self.distribution = distribution
        return self
    }
    
    @discardableResult public func style(layoutMarginsRelativeArrangement: Bool) -> Self
    {
        self.isLayoutMarginsRelativeArrangement = layoutMarginsRelativeArrangement
        return self
    }
}

extension UIControl
{
    @discardableResult public func style(target: AnyObject?, action: Selector, controlEvents: UIControl.Event = .touchUpInside) -> Self
    {
        addTarget(target, action: action, for: controlEvents)
        return self
    }
}

extension UIButton
{
    @discardableResult public func style(imageRes: String) -> Self
    {
        return style(image: UIImage(named: imageRes))
    }
    
    @discardableResult public func style(image: UIImage?) -> Self
    {
        setImage(image, for: UIControl.State())
        return self
    }
    
    @discardableResult public func style(textAlignment: UIControl.ContentHorizontalAlignment) -> Self
    {
        contentHorizontalAlignment = textAlignment
        return self
    }
    
    @discardableResult public func style(titleColor: UIColor?) -> Self
    {
        setTitleColor(titleColor, for: UIControl.State())
        return self
    }
    
    @discardableResult public func style(numberOfLines: Int) -> Self
    {
        titleLabel?.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult public func style(font: UIFont?) -> Self
    {
        titleLabel?.font = font
        return self
    }
    
    @discardableResult public func style(contentEdgeInsets: UIEdgeInsets) -> Self
    {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }
    
    @discardableResult public func style(imageEdgeInsets: UIEdgeInsets) -> Self
    {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
    
    @discardableResult public func style(titleEdgeInsets: UIEdgeInsets) -> Self
    {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }
    
    @discardableResult public func style(isEnabled: Bool) -> Self
    {
        self.isEnabled = isEnabled
        return self
    }
    
    @discardableResult public func style(title: String? = nil, fontSize: Int? = nil, fontStyle: UIFont.Weight? = UIFont.Weight.regular, fontColor: UIColor? = nil) -> Self
    {
        if let title = title
        {
            setTitle(title, for: UIControl.State())
        }
        
        if let fontColor = fontColor
        {
            setTitleColor(fontColor, for: UIControl.State())
        }
        
        if fontSize != nil || fontStyle != nil
        {
            var fontSizeNew: CGFloat = 0.0
            if let fontSize = fontSize
            {
                fontSizeNew  = CGFloat(fontSize)
            }
            
            titleLabel?.font = UIFont.systemFont(ofSize: fontSizeNew, weight: fontStyle ?? UIFont.Weight.regular)
        }
        
        return self
    }
}

extension UILabel
{
    @discardableResult public func style(text: String?) -> Self
    {
        self.text = text
        return self
    }
    
    @discardableResult public func style(numberOfLines: Int) -> Self
    {
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult public func style(alignment: NSTextAlignment) -> Self
    {
        textAlignment = alignment
        return self
    }
    
    @discardableResult public func style(font: UIFont) -> Self
    {
        self.font = font
        return self
    }
    
    @discardableResult public func styleAdjustsFontSizeToFitWidth() -> Self
    {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult public func style(minimumScaleFactor: CGFloat) -> Self
    {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult public func style(textColor: UIColor?) -> Self
    {
        self.textColor = textColor
        return self
    }
    
    @discardableResult public func style(text: String? = nil, fontSize: Int? = nil, fontStyle:  UIFont.Weight? = UIFont.Weight.regular, fontColor: UIColor? = nil) -> Self
    {
        self.text = text
        
        if let fontColor = fontColor
        {
            self.textColor = fontColor
        }
        
        if fontSize != nil || fontStyle != nil
        {
            var fontSizeNew = font.pointSize
            if let fontSize = fontSize
            {
                fontSizeNew  = CGFloat(fontSize)
            }
            
            font = UIFont.systemFont(ofSize: fontSizeNew, weight: fontStyle ?? UIFont.Weight.regular)
        }
        
        return self
    }
}

extension UITextField
{
    @discardableResult public func style(placeholder: String?) -> Self
    {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult public func style(textAlignment: NSTextAlignment) -> Self
    {
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult public func style(inputAccessoryView: UIView?) -> Self
    {
        self.inputAccessoryView = inputAccessoryView
        return self
    }
    
    @discardableResult public func style(font: UIFont) -> Self
    {
        self.font = font
        return self
    }
    
    @discardableResult public func style(textColor: UIColor) -> Self
    {
        self.textColor = textColor
        return self
    }
    
    @discardableResult public func style(secureTextEntry: Bool) -> Self
    {
        self.isSecureTextEntry = secureTextEntry
        return self
    }
    
    @discardableResult public func style(keyboardType: UIKeyboardType) -> Self
    {
        self.keyboardType = keyboardType
        return self
    }
    
}

extension UIScrollView
{
    @discardableResult public func style(pagingEnabled: Bool) -> Self
    {
        self.isPagingEnabled = pagingEnabled
        return self
    }
    
    @discardableResult public func style(showsHorizontal: Bool) -> Self
    {
        self.showsHorizontalScrollIndicator = showsHorizontal
        return self
    }
    
    @discardableResult public func style(showsVertical: Bool) -> Self
    {
        self.showsVerticalScrollIndicator = showsVertical
        return self
    }
    
    @discardableResult public func style(bounces: Bool) -> Self
    {
        self.bounces = bounces
        return self
    }
}

extension UIImageView
{
    @discardableResult public func style(image: UIImage?) -> Self
    {
        self.image = image
        return self
    }
    
    @discardableResult public func style(imageRes: String) -> Self
    {
        self.image = UIImage(named: imageRes)
        return self
    }
}
