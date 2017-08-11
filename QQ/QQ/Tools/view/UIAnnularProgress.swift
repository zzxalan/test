//
//  UIAnnularProgress.swift
//  LingQi
//
//  Created by apple on 17/3/16.
//  Copyright © 2017年 zzxwork. All rights reserved.
//

import UIKit


struct ProgressProperty{
    var width: CGFloat            //进度条宽度
    var trackColor: UIColor       //底部颜色
    var progressColor: UIColor   //进度条颜色
    var progressStart: CGFloat    //起始位置
    var progressEnd: CGFloat      //结束位置
    
    init(width:CGFloat,progressEnd:CGFloat,progressColor:UIColor) {
        self.width = width
        self.progressEnd = progressEnd
        self.progressColor = progressColor
        trackColor = UIColor.gray
        progressStart = 0.0
    }
    
    init() {
        width = 10
        trackColor = UIColor.gray
        progressColor = UIColor.green
        progressStart = 0.0
        progressEnd = 0
    }
}
class UIAnnularProgress: UIView {
    
    var progressProperty = ProgressProperty.init()
    fileprivate let progressLayer = CAShapeLayer()
    
    init(propressProperty:ProgressProperty,frame:CGRect) {
        self.progressProperty = propressProperty
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: self.width / 2, y: self.height / 2), radius: (frame.width / 2), startAngle: (3.14 / 3 * 2), endAngle: (3.14 / 3), clockwise: true).cgPath
        
        let trackLayer = CAShapeLayer()
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = progressProperty.trackColor.cgColor
        trackLayer.lineWidth = progressProperty.width
        trackLayer.path = path
        trackLayer.strokeStart = 0.0
        trackLayer.strokeEnd = 1
        layer.addSublayer(trackLayer)
        
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressProperty.progressColor.cgColor
        progressLayer.lineWidth = progressProperty.width
        progressLayer.path = path
        progressLayer.strokeStart = progressProperty.progressStart
        progressLayer.strokeEnd = progressProperty.progressEnd
        layer.addSublayer(progressLayer)
        
    }
    
    func setProgress(_ progress:CGFloat,time:CFTimeInterval,animate:Bool) {
        CATransaction.begin()
        CATransaction.setDisableActions(!animate)
        CATransaction.setAnimationDuration(time)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        progressLayer.strokeEnd = progress
        CATransaction.commit()
        
    }
}
