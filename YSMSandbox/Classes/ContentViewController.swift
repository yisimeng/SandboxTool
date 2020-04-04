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
    }

}

extension ContentViewController{
    func fatchData() {
        DispatchQueue.global().async {
            let fileManager = FileManager.default
            guard let fileContent = try? String(contentsOfFile: self.document.fullPath, encoding: .utf8) else {return}
            DispatchQueue.main.async {
                self.textView.text = fileContent
            }
        }
    }
}
