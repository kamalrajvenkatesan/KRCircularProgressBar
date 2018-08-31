//
//  KRCircularProgressBar.swift
//  KRCircularProgressBar
//
//  Created by kamalraj venkatesan on 31/08/18.
//

@objc protocol KRCircularProgressBarDelegate {
  @objc optional func processCompleted()
}

import UIKit

@IBDesignable
class KRCircularProgressBar: UIView {

  /** Radius of the Circular progress bar */
  @IBInspectable var radius: CGFloat = 10.0

  @IBInspectable var progressBarColor: UIColor = UIColor.blue

  /** Width of the progress bar */
  @IBInspectable var progressBarWith: CGFloat = 10.0

  @IBInspectable var needRoundedCornerAtEdge: Bool = false

  /** Width of the tracker line*/
  @IBInspectable var trackerWidth: CGFloat = 10.0

  /** color for the tracker */
  @IBInspectable var trackerColor: UIColor = UIColor.lightGray

  @IBOutlet var delegate: KRCircularProgressBarDelegate?

  private let shapeLayer = CAShapeLayer()
  private var progressValue: Float = 0.0
  private var centerPoint: CGPoint = CGPoint(x: 0, y: 0)


  /** To update the progress bar current status*/
  public var progress: Float = 0.0 {
    didSet {

      let value = progress * 0.8

      let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
      basicAnimation.duration = 0.3
      basicAnimation.fromValue = progressValue

      basicAnimation.toValue = value
      progressValue = value

      basicAnimation.fillMode = kCAFillModeForwards
      basicAnimation.isRemovedOnCompletion = false

      shapeLayer.add(basicAnimation, forKey: "ProgressBar")

      //      if progress == 1.0 {
      //        self.processCompleted()
      //      }

    }
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)
    self.centerPoint = CGPoint(x: rect.midX, y: rect.midY)
    updateView()
  }

  private func updateView() {

    let circularPath = UIBezierPath(arcCenter: self.centerPoint, radius: self.radius, startAngle: -(CGFloat.pi / 2), endAngle: 2 * CGFloat.pi, clockwise: true)

    var trackLayer: CAShapeLayer {
      let tl = CAShapeLayer()
      tl.path = circularPath.cgPath
      tl.fillColor = UIColor.clear.cgColor
      tl.lineCap = kCALineCapRound
      tl.strokeColor = trackerColor.cgColor
      tl.lineWidth = self.trackerWidth

      return tl
    }

    self.layer.addSublayer(trackLayer)

    shapeLayer.path = circularPath.cgPath

    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.lineCap = (self.needRoundedCornerAtEdge) ? kCALineCapRound : kCALineCapSquare

    shapeLayer.strokeColor = self.progressBarColor.cgColor
    shapeLayer.lineWidth = self.progressBarWith

    shapeLayer.strokeEnd = 0

    self.layer.addSublayer(shapeLayer)

  }

  private func processCompleted() {
    UIView.animate(withDuration: 0.2) {
      self.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
  }

}

