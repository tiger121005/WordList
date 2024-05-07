//
//  AddViewController.swift
//  WordList
//
//  Created by TAIGA ITO on 2024/05/07.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String,String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }
    }
    
    @IBAction func saveWord() {
        let englishWord = englishTextField.text ?? ""
        let japaneseWord = japaneseTextField.text ?? ""
        
        if englishWord.isEmpty || japaneseWord.isEmpty {
            let alert = UIAlertController(
                title: "保存できません",
                message: "単語を入力してください",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            
            present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        }
    }
}
