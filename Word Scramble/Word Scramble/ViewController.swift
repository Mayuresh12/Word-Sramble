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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))


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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    func submit(_ answer: String) {


    }
    
    func isPossible(word: String) -> Bool {
        return true
    }

    func isOriginal(word: String) -> Bool {
        return true
    }

    func isReal(word: String) -> Bool {
        return true
    }
            
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
                guard let answer = ac?.textFields?[0].text else { return }
                self?.submit(answer)
            }

            ac.addAction(submitAction)
            present(ac, animated: true)
        }
}

