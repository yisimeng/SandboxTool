//
//  SandboxTool.swift
//  YSMSandbox
//
//  Created by duanzengguang on 2020/4/4.
//

import UIKit

public struct SandboxTool {
    
    public static func showSandbox() {
        
        let directory = DirectoryViewController()
        let nav = UINavigationController(rootViewController: directory)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
    }
}


