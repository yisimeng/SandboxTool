//
//  ContentViewController.swift
//  YSMSandbox
//
//  Created by duanzengguang on 2020/4/4.
//

import UIKit

class ContentViewController: UIViewController {

    var textView: UITextView = UITextView(frame: .zero)
    var document: Document!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.frame = view.bounds
        view.addSubview(textView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "关闭", style: .done, target: self, action: #selector(dissmissAction))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fatchData()
    }
}

extension ContentViewController{
    func fatchData() {
        DispatchQueue.global().async {
            guard let fileContent = try? String(contentsOfFile: self.document.fullPath, encoding: .utf8) else {return}
            DispatchQueue.main.async {
                self.textView.text = fileContent
            }
        }
    }
    
    @objc func dissmissAction() {
        dismiss(animated: true, completion: nil)
    }
}
