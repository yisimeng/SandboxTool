//
//  SandboxTool.swift
//  YSMSandbox
//
//  Created by duanzengguang on 2020/4/4.
//

import UIKit

public class SandboxTool {
    
    public static func registed() {
        SandboxTool.shared.registed()
        print("【SandboxTool log】 home directory : \(NSHomeDirectory())")
    }
    
    static let shared: SandboxTool = SandboxTool()
    
    func registed() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        tap.numberOfTouchesRequired = 2
        UIApplication.shared.delegate!.window??.addGestureRecognizer(tap)
    }
    
    @objc func tapAction(_ tap: UITapGestureRecognizer) {
        let directory = DirectoryViewController()
        let nav = UINavigationController(rootViewController: directory)
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
    }
}


