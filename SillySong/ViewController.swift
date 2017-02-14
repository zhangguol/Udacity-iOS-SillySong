//
//  ViewController.swift
//  SillySong
//
//  Created by Boxuan Zhang on 2/13/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    @IBAction func reset(_ sender: UITextField) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: UITextField) {
        guard let fullName = sender.text, !fullName.isEmpty else {
            lyricsView.text = ""
            return
        }
        
        lyricsView.text = LyricsGenerator.shared.lyrics(for: fullName)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
