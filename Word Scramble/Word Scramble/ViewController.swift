//
//  ViewController.swift
//  Word Scramble
//
//  Created by Mayuresh Rao on 9/14/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let starWords = try? String(contentsOf: startWordsUrl){
                allWords = starWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    func startGame()  {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }

}

