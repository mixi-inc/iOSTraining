//
//  ViewController.swift
//  FileManagerSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    func fileURL() -> URL? {
        // TODO: FileManagerを作ってDocumentDirectoryのURLを取得
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // TODO: URLから絶対パスを取得
        guard let url = urls.first else { return nil }
        
        // TODO: 保存するファイル（save.xml）をDocumentのパスに追加
        let newUrl = url.appendingPathComponent("save.dat")
        
        // TODO: ファイルパスを返す
        return newUrl
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // TODO: textField1とtextField2の内容をDictionaryに変換して保存
        guard let fileUrl = fileURL() else { return }
        let saveDict = [
            "textField1" : "\(textField1.text ?? "")",
            "textField2" : "\(textField2.text ?? "")"
        ]
        if NSKeyedArchiver.archiveRootObject(saveDict, toFile: fileUrl.path) {
            print("success")
        } else {
            print("failed")
        }
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        // TODO: データを読み込んで、textField1とtextField2に内容を表示
        guard let fileUrl = fileURL(), FileManager.default.fileExists(atPath: fileUrl.path) else {
            print("not exist")
            return
        }
        guard let readDict = NSKeyedUnarchiver.unarchiveObject(withFile: fileUrl.path) as? [String : String] else { return }
        textField1.text = readDict["textField1"]
        textField2.text = readDict["textField2"]
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        // TODO: ファイルの削除
        guard let fileUrl = fileURL(), FileManager.default.fileExists(atPath: fileUrl.path) else {
            print("not exist")
            return
        }
        do {
            try FileManager.default.removeItem(atPath: fileUrl.path)
        } catch {
            print("failed")
        }
    }
}

