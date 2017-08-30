//
//  ViewController.swift
//  跟控制器
//
//  Created by 高帅 on 2017/8/29.
//  Copyright © 2017年 高帅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(push), for: .touchUpInside)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController{
    @objc func push() {
        let twoVc: TwoViewController = TwoViewController()
        self.navigationController?.pushViewController(twoVc, animated: true)
    }
}
