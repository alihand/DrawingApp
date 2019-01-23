import UIKit

class DrawView : UIView {
    
    var lineColor : CGColor = UIColor.white.cgColor
    var lineWidth : CGFloat!
    var path : UIBezierPath!
    var touchPoint : CGPoint!
    var startingPoint : CGPoint!
    
    override func layoutSubviews(){
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        lineWidth = 10
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first
        touchPoint = touch?.location(in: self)
    
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setNeedsDisplay()
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
    func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    func clearCanvas(){
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.lineColor = UIColor.white.cgColor
        self.setNeedsDisplay()
    }
}
