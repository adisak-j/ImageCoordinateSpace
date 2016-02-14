//: [Previous](@previous)

import UIKit
import CoordinatedSpace
//: Center
let backgroundImage = [#Image(imageLiteral: "inspiration.jpg")#]
let containerView = UIImageView(image: backgroundImage)
let imageSpace = containerView.imageCoordinatedSpace()
let containerSize = CGSize(width: 200, height: 200)
containerView.contentMode = .Center
containerView.bounds = CGRect(origin: CGPointZero, size: containerSize)
let svgUrl = NSBundle.mainBundle().URLForResource("overlayed", withExtension: "svg")!
let svgString = try! String(contentsOfURL: svgUrl)
assert(svgString.containsString("x=\"321\" y=\"102\" width=\"63\" height=\"64\""))
let placement = CGRect(x: 321, y: 102, width: 63, height: 64)
let overlayView = UIImageView(image:[#Image(imageLiteral: "hello.png")#])
containerView.addSubview(overlayView)
overlayView.alpha = 0.8
func updateContentMode(mode: UIViewContentMode) -> UIView {
    containerView.contentMode = mode
    overlayView.frame = imageSpace.convertRect(placement, toCoordinateSpace: containerView)
    return containerView
}
updateContentMode(containerView.contentMode)
overlayView.frame
assert(imageSpace.convertPoint(overlayView.frame.origin, fromCoordinateSpace: containerView) == placement.origin)
assert(imageSpace.convertRect(overlayView.frame, fromCoordinateSpace: containerView) == placement)
updateContentMode(.ScaleToFill)
updateContentMode(.ScaleAspectFit)
updateContentMode(.ScaleAspectFill)
updateContentMode(.Top)
updateContentMode(.Bottom)
containerView.frame = CGRect(origin: CGPointZero, size: CGSize(width: 400, height: 200))
updateContentMode(.Left)
updateContentMode(.Right)
updateContentMode(.TopLeft)
updateContentMode(.TopRight)
updateContentMode(.BottomLeft)
updateContentMode(.BottomRight)
//: [Next](@next)
