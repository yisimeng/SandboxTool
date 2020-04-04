//
//  ViewController.swift
//  YSMSandbox
//
//  Created by yisimeng on 04/04/2020.
//  Copyright (c) 2020 yisimeng. All rights reserved.
//

import UIKit
import YSMSandbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapAction(_ tap: UITapGestureRecognizer) {
        SandboxTool.showSandbox()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

