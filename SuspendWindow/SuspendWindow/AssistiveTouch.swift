//
//  AssistiveTouch.swift
//  SuspendWindow
//
//  Created by 高帅 on 2017/8/29.
//  Copyright © 2017年 高帅. All rights reserved.
//

import UIKit

class AssistiveTouch: UIWindow {

    var button: UIButton? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpui()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    

}

extension AssistiveTouch{
    func setUpui() -> Void {
       self.backgroundColor = UIColor.clear
       self.windowLevel = UIWindowLevelAlert + 1
        self.makeKeyAndVisible()
        
        button = UIButton(type: .custom)
        button?.backgroundColor = UIColor.gray
        button?.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        button?.addTarget(self, action: #selector(choose), for: .touchUpInside)
        self.addSubview(button!)
        // 拖动手势
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(changePostion(pan:)))
        button?.addGestureRecognizer(pan)
        
        
        
    }
    
}

//MARK: --ACTION
extension AssistiveTouch{
    
   @objc func choose() {
        print("选中")
    }
   @objc func changePostion(pan: UIPanGestureRecognizer) {
        // 上下左右的边界
    let width: CGFloat = UIScreen.main.bounds.width
    let height: CGFloat = UIScreen.main.bounds.height
    
    
    let point: CGPoint = pan.translation(in: self)
//    print(point)
    var originalFrame: CGRect = self.frame
    if originalFrame.origin.x >= 0 && (originalFrame.origin.x + originalFrame.size.width <= width) {
        originalFrame.origin.x =  point.x + originalFrame.origin.x
    }
    if originalFrame.origin.y >= 0 && (originalFrame.origin.y + originalFrame.size.height <= height) {
        originalFrame.origin.y = originalFrame.origin.y + point.y
    }
    self.frame = originalFrame
    pan.setTranslation(CGPoint.zero, in: self)
    if pan.state == UIGestureRecognizerState.began {
        button?.isEnabled = false
    }else if (pan.state == .changed){
        
    }else{
        var frame: CGRect = self.frame
        // 记录是否越界
        var isover: Bool = false
        if frame.origin.x < 0{
            frame.origin.x = 0
            isover = true
            
        }else if frame.origin.x + frame.size.width > width{
            
            frame.origin.x = width - frame.size.width
            isover = true
        }
        
        if frame.origin.y < 0{
            frame.origin.y = 0
            isover = true
        }else if frame.origin.y + frame.size.height > height{
            frame.origin.y = height - frame.size.height
            isover = true
        }
        if isover{
            UIView.animate(withDuration: 0.3, animations: {
                self.frame = frame
            })
        }
        button?.isEnabled = true
        
        
    }
    
    
    }
}
