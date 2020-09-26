
# Word-Sramble

_Description_

Create an anagram game while learning about closures and booleans.


# App Demo

![](gif/WordScramble400.gif) 

Concepts used here in this project.
------------------------------------------------

- Make use of UITextChecker to check if the spellings are correct or not.
```swift
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
```

- Load the data from the txt file from were the word will be used in scramble
```swift
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
```


