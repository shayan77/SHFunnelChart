//
//  SHFunnelChart.swift
//  SHFunnelChart
//
//  Created by Shayan Mehranpoor on 3/7/20.
//  Copyright © 2020 Shayan Mehranpoor. All rights reserved.
//

import UIKit

public class SHFunnelChart: UIView {
    
    private var _animateIntoViewWhenPropertiesChange = false
    private var _drawCount = 0
    private var _coneLipHeightAsFractionOfViewHeight: CGFloat = 0.03
    private var _stemHeightAsFractionOfViewHeight: CGFloat = 0.5
    private var _stemWidthAsFractionOfViewWidth: CGFloat = 0.15
    private var _sliceSpacingAsFractionOfViewHeight: CGFloat = 0.002

    private var _drawHorizontalLines = true
    private var _horizontalLinesColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
    private var _horizontalLinesThickness: CGFloat = 1.0
    private var _horizontalLinesDashStyle: [CGFloat] = [0.0, 4.0]
    
    private var _drawFunnelLeftShadow = true
    private var _funnelLeftShadowWidthAsFractionOfViewWidth: CGFloat = 0.15

    private var _textShadowColor = UIColor.black.withAlphaComponent(0.25)
    private var _textShadowOffset = CGSize(width:0, height:1);

    private var _drawLabels = true
    private var _font = UIFont.boldSystemFont(ofSize: 14.0)
    private var _labelsWidthAsFractionOfStemWidth: CGFloat = 0.75
    private var _textColor = UIColor.white

    private var _values: [Double] = [6, 5, 4, 3, 2]

    private var _colorPalette: [UIColor] = [
            UIColor(red:0.95, green:0.77, blue:0.06, alpha:1.0), // #f1c40f
            UIColor(red:0.90, green:0.49, blue:0.13, alpha:1.0), // #e67e22
            UIColor(red:0.91, green:0.30, blue:0.24, alpha:1.0), // #e74c3c
            UIColor(red:0.10, green:0.74, blue:0.61, alpha:1.0), // #1abc9c
            UIColor(red:0.18, green:0.80, blue:0.44, alpha:1.0), // #2ecc71
            UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0), // #3498db
            UIColor(red:0.61, green:0.35, blue:0.71, alpha:1.0), // #9b59b6
            UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0), // #34495e
            UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0), // #ecf0f1
            UIColor(red:0.58, green:0.65, blue:0.65, alpha:1.0)  // #95a5a6
    ]

    //
    // MARK: Public properties
    //
    
    public var values : [Double] {
        set (newVal) {
            _values = newVal
            self.setNeedsDisplay()
        }
        get{
            return _values
        }
    }

    public var coneLipHeightAsFractionOfViewHeight: CGFloat {
        set (newVal) {
            _coneLipHeightAsFractionOfViewHeight = newVal
            self.setNeedsDisplay()
        }
        get{
            return _coneLipHeightAsFractionOfViewHeight
        }
    }

    public var stemHeightAsFractionOfViewHeight: CGFloat {
        set (newVal) {
            _stemHeightAsFractionOfViewHeight = newVal
            self.setNeedsDisplay()
        }
        get{
            return _stemHeightAsFractionOfViewHeight
        }
    }

    public var stemWidthAsFractionOfViewWidth : CGFloat {
        set (newVal) {
            _stemWidthAsFractionOfViewWidth = newVal
            self.setNeedsDisplay()
        }
        get{
            return _stemWidthAsFractionOfViewWidth
        }
    }

    public var sliceSpacingAsFractionOfViewHeight: CGFloat {
        set (newVal) {
            _sliceSpacingAsFractionOfViewHeight = newVal
            self.setNeedsDisplay()
        }
        get{
            return _sliceSpacingAsFractionOfViewHeight
        }
    }

    public var drawHorizontalLines : Bool {
        set (newVal) {
            _drawHorizontalLines = newVal
            self.setNeedsDisplay()
        }
        get{
            return _drawHorizontalLines
        }
    }

    public var horizontalLinesColor : UIColor {
        set (newVal) {
            _horizontalLinesColor = newVal
            self.setNeedsDisplay()
        }
        get{
            return _horizontalLinesColor
        }
    }

    public var horizontalLinesThickness : CGFloat {
        set (newVal) {
            _horizontalLinesThickness = newVal
            self.setNeedsDisplay()
        }
        get{
            return _horizontalLinesThickness
        }
    }

    public var horizontalLinesDashStyle : [CGFloat] {
        set (newVal) {
            _horizontalLinesDashStyle = newVal
            self.setNeedsDisplay()
        }
        get{
            return _horizontalLinesDashStyle
        }
    }

    public var drawFunnelLeftShadow: Bool {
        set (newVal) {
            _drawFunnelLeftShadow = newVal
            self.setNeedsDisplay()
        }
        get{
            return _drawFunnelLeftShadow
        }
    }

    public var funnelLeftShadowWidthAsFractionOfViewWidth: CGFloat {
        set (newVal) {
            _funnelLeftShadowWidthAsFractionOfViewWidth = newVal
            self.setNeedsDisplay()
        }
        get{
            return _funnelLeftShadowWidthAsFractionOfViewWidth
        }
    }

    public var textShadowColor : UIColor {
        set (newVal) {
            _textShadowColor = newVal
            self.setNeedsDisplay()
        }
        get{
            return _textShadowColor
        }
    }

    public var textShadowOffset : CGSize {
        set (newVal) {
            _textShadowOffset = newVal
            self.setNeedsDisplay()
        }
        get{
            return _textShadowOffset
        }
    }
    
    public var drawLabels : Bool {
        set (newVal) {
            _drawLabels = newVal
            self.setNeedsDisplay()
        }
        get{
            return _drawLabels
        }
    }
    
    public var font : UIFont {
        set (newVal) {
            _font = newVal
            self.setNeedsDisplay()
        }
        get{
            return _font
        }
    }
    
    public var labelsWidthAsFractionOfStemWidth : CGFloat {
        set (newVal) {
            _labelsWidthAsFractionOfStemWidth = newVal
            self.setNeedsDisplay()
        }
        get{
            return _labelsWidthAsFractionOfStemWidth
        }
    }
    
    public var textColor : UIColor {
        set (newVal) {
            _textColor = newVal
            self.setNeedsDisplay()
        }
        get{
            return _textColor
        }
    }
    
    public var colorPalette : [UIColor] {
        set (newVal) {
            _colorPalette = newVal
            self.setNeedsDisplay()
        }
        get{
            return _colorPalette
        }
    }
    
    public var animateIntoViewWhenPropertiesChange: Bool {
        set (newVal) {
            _animateIntoViewWhenPropertiesChange = newVal
            self.setNeedsDisplay()
        }
        get{
            return _animateIntoViewWhenPropertiesChange
        }
    }

    //
    // MARK: Initialization
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.contentMode = UIView.ContentMode.redraw
    }
    
    //
    // MARK: Drawing
    //
    
    override public func draw(_ rect: CGRect) {
        
        // Cleanup
        self.layer.sublayers?.removeAll()

        //
        // Setup a graphics context to draw horizontal lines.
        //
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setStrokeColor(_horizontalLinesColor.cgColor)
        ctx?.setLineWidth(_horizontalLinesThickness)
        ctx?.setLineCap(.round)
        ctx?.setLineDash(phase: 0.0, lengths: _horizontalLinesDashStyle)
        //
        // Calculating pixel dimensions...
        //
        let stemWidth = self._stemWidthAsFractionOfViewWidth * rect.size.width
        let stemHeight = self._stemHeightAsFractionOfViewHeight * rect.size.height
        let coneLipHeight = self._coneLipHeightAsFractionOfViewHeight * rect.size.height
        let coneHeight = rect.size.height - stemHeight - coneLipHeight
        let slopeWidth = (rect.size.width - stemWidth) / 2
        let slopeAngle = atan2(slopeWidth, coneHeight)
        let slopeTan = tan(slopeAngle)

        let totalValues = _values.reduce(0, +)
        var cumulativeValue: Double = 0
        
        var index = 0

        //
        // Draw each slice of the funnel based on values.
        //
        for val in _values {

            let shape = CAShapeLayer()
            self.layer.addSublayer(shape)
            shape.fillColor = self._colorPalette[index % self._colorPalette.count].cgColor
            
            let shapeShadow = CAShapeLayer()
            self.layer.addSublayer(shapeShadow)
            shapeShadow.fillColor = UIColor.black.withAlphaComponent(0.1).cgColor

            let startY = (CGFloat(cumulativeValue / totalValues) + (index == 0 ? 0 : _sliceSpacingAsFractionOfViewHeight)) * rect.height
            let endY = (CGFloat((cumulativeValue + val) / totalValues) - (index == (_values.count - 1) ? 0 : _sliceSpacingAsFractionOfViewHeight)) * rect.height
            let endYNoSpacing = CGFloat((cumulativeValue + val) / totalValues) * rect.height

            let percentLabel = UILabel()
            percentLabel.text = String.localizedStringWithFormat("%.0f%@", (val / totalValues * 100.0), "%")
            percentLabel.frame = CGRect(x: slopeWidth + ((stemWidth - stemWidth * _labelsWidthAsFractionOfStemWidth) / 2), y: startY, width: stemWidth * _labelsWidthAsFractionOfStemWidth, height: endY - startY)
            percentLabel.font = self._font
            percentLabel.textColor = self._textColor
            percentLabel.shadowColor = self._textShadowColor
            percentLabel.shadowOffset = self._textShadowOffset
            percentLabel.textAlignment = .center
            percentLabel.adjustsFontSizeToFitWidth = true
            percentLabel.numberOfLines = 2
            percentLabel.minimumScaleFactor = 0.5

            var points = [CGPoint]()
            
            if endY < coneLipHeight { // The section is above the lip of the cone.
                let startX1: CGFloat = 0
                let endX1: CGFloat = rect.width
                let startX2: CGFloat = 0
                let endX2: CGFloat = rect.width

                points.append(CGPoint(x: startX1, y: startY))
                points.append(CGPoint(x: startX2, y: endY))
                points.append(CGPoint(x: endX2, y: endY))
                points.append(CGPoint(x: endX1, y: startY))

            }
            else if startY < coneLipHeight && endY > coneLipHeight && endY < (coneHeight + coneLipHeight) { // The section is above the lip of the cone and above the junction of the cone and the stem.
                let startX1: CGFloat = 0
                let endX1: CGFloat = rect.width

                let startX2 = startX1
                let endX2 = rect.width - startX2

                let startX3 = slopeTan * (endY - coneLipHeight)
                let endX3 = rect.width - startX3

                points.append(CGPoint(x: startX1, y: startY))
                points.append(CGPoint(x: startX2, y: coneLipHeight))
                points.append(CGPoint(x: startX3, y: endY))
                points.append(CGPoint(x: endX3, y: endY))
                points.append(CGPoint(x: endX2, y: coneLipHeight))
                points.append(CGPoint(x: endX1, y: startY))
            }
            else if startY < coneLipHeight && endY > coneLipHeight && endY >= (coneHeight + coneLipHeight) { // The section is above the lip of the cone and below the junction of the cone and the stem
                let startX1: CGFloat = 0
                let endX1: CGFloat = rect.width

                let startX2 = startX1
                let endX2 = rect.width - startX2

                let startX3 = slopeTan * coneHeight
                let endX3 = rect.width - startX3

                let startX4 = slopeWidth
                let endX4 = rect.width - startX4

                points.append(CGPoint(x: startX1, y: startY))
                points.append(CGPoint(x: startX2, y: coneLipHeight))
                points.append(CGPoint(x: startX3, y: coneHeight + coneLipHeight))
                points.append(CGPoint(x: startX4, y: endY))
                points.append(CGPoint(x: endX4, y: endY))
                points.append(CGPoint(x: endX3, y: coneHeight + coneLipHeight))
                points.append(CGPoint(x: endX2, y: coneLipHeight))
                points.append(CGPoint(x: endX1, y: startY))
            }
            else if endY < (coneHeight + coneLipHeight) { // The section is below the lip of the cone and above the junction of the cone and the stem
                let startX1 = slopeTan * startY
                let endX1 = rect.width - startX1
                let startX2 = slopeTan * endY
                let endX2 = rect.width - startX2
                
                points.append(CGPoint(x: startX1, y: startY))
                points.append(CGPoint(x: startX2, y: endY))
                points.append(CGPoint(x: endX2, y: endY))
                points.append(CGPoint(x: endX1, y: startY))
            }
            else if startY >= (coneHeight + coneLipHeight) { // The section is part of the stem only.
                let startX1 = slopeWidth
                let endX1 = slopeWidth + stemWidth
                let startX2 = slopeWidth
                let endX2 = slopeWidth + stemWidth

                points.append(CGPoint(x: startX1, y: startY))
                points.append(CGPoint(x: startX2, y: endY))
                points.append(CGPoint(x: endX2, y: endY))
                points.append(CGPoint(x: endX1, y: startY))
            }
            else { // The section is above the junction of the cone and the stem and below the junction of the cone and the stem.
                let startX1 = slopeTan * (startY - coneLipHeight)
                let endX1 = rect.width - startX1
                
                let startX2 = slopeWidth
                let endX2 = rect.width - startX2

                let startX3 = slopeWidth
                let endX3 = rect.width - startX3
                
                points.append(CGPoint(x: startX1, y: startY))
                points.append(CGPoint(x: startX2, y: coneHeight + coneLipHeight))
                points.append(CGPoint(x: startX3, y: endY))
                points.append(CGPoint(x: endX3, y: endY))
                points.append(CGPoint(x: endX2, y: coneHeight + coneLipHeight))
                points.append(CGPoint(x: endX1, y: startY))
            }
            
            if self._drawHorizontalLines {
                ctx?.move(to: CGPoint(x: 0, y: endYNoSpacing))
                ctx?.addLine(to: CGPoint(x: rect.width, y: endYNoSpacing))
                ctx?.strokePath()
            }
            
            
            let path = UIBezierPath()
            var first = true
            for pt in points {
                if first {
                    path.move(to: pt)
                    
                }
                else{
                    path.addLine(to: pt)
                }
                first = false
            }
            path.close()
            shape.path = path.cgPath

            if _drawFunnelLeftShadow {
                let pathShadow = UIBezierPath()
                var pointIndex = 0
                for pt in points {
                    if pointIndex == 0 {
                        pathShadow.move(to: pt)
                    } else {
                        if pointIndex < points.count / 2 {
                            pathShadow.addLine(to: pt)
                        } else {
                            pathShadow.addLine(to: CGPoint(x: points[points.count - pointIndex - 1].x
                                    + stemWidth * _funnelLeftShadowWidthAsFractionOfViewWidth, y: pt.y))
                        }
                    }
                    pointIndex += 1
                }
                pathShadow.close()
                shapeShadow.path = pathShadow.cgPath
            }

            if _drawCount == 0 || _animateIntoViewWhenPropertiesChange {
                CATransaction.begin()
                CATransaction.setCompletionBlock({
                    shape.position.x = 0
                    shapeShadow.position.x = 0

                    // Add % label
                    if self._drawLabels {
                        self.addSubview(percentLabel)
                    }
                })
                let animation = CABasicAnimation()
                animation.keyPath = "position.x"
                animation.fromValue = -rect.width
                animation.toValue = 0
                animation.duration = 0.50
                animation.fillMode = CAMediaTimingFillMode.forwards
                animation.isRemovedOnCompletion = false
                animation.beginTime = CACurrentMediaTime() + (Double(index) * 0.05)
                animation.timingFunction = CAMediaTimingFunction(controlPoints: 1.0, 0, 0, 1.0)

                shape.add(animation, forKey: "basic")
                shape.position.x = -rect.width

                shapeShadow.add(animation, forKey: "basic")
                shapeShadow.position.x = -rect.width

                CATransaction.commit()
            }
            else{
                self.addSubview(percentLabel)
            }

            cumulativeValue += val

            index += 1
        }

        _drawCount += 1
    }
}
