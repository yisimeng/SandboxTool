//
//  DocumentViewController.swift
//  YSMSandbox
//
//  Created by duanzengguang on 2020/4/4.
//

import UIKit

let kDirectorCellIndentifier: String = "kDirectorCellIndentifier"

class DirectoryViewController: UITableViewController {

    var dataSource: [Document] = []
    
    // 默认当前路径为Home
    var directoryPath: String = NSHomeDirectory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kDirectorCellIndentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fatchData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kDirectorCellIndentifier, for: indexPath)
        let file = dataSource[indexPath.row]
        cell.textLabel?.text = file.fileName
        cell.accessoryType = (file.type == .directory) ? .disclosureIndicator : .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let document = dataSource[indexPath.row]
        switch document.type {
        case .directory:
            let directory = DirectoryViewController()
            directory.directoryPath = document.fullPath
            navigationController?.pushViewController(directory, animated: true)
        case .file:
            let content = ContentViewController()
            content.document = document
            navigationController?.pushViewController(content, animated: true)
        }
    }
}

extension DirectoryViewController{
    func fatchData() {
        DispatchQueue.global().async {
            let fileManager: FileManager = FileManager.default
            guard let files = try? fileManager.contentsOfDirectory(atPath: self.directoryPath) else {return}
            self.dataSource = files.map({ fileName -> Document in
                let document:Document = Document(path: self.directoryPath, file: fileName)
                return document
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
