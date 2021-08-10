//
//  ViewController.swift
//  SimpleColorApp
//
//  Created by Amber on 8/4/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var factTextLabel: UILabel!
    
    @IBOutlet var showAnotherFactButton: UIButton!

  
    override func viewDidLoad() {       super.viewDidLoad()
        factTextLabel.text = textArr[0]
    }
    
    
    let textArr: [String] = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.", "Contrary to popular belief, Lorem Ipsum is not simply random text.", "Richard McClintock, a Latin professor at Hampden-Sydney College in ", "looked up one of the more obscure Latin words, consectetur", "from a Lorem Ipsum passage, and going through the cities of the word", "This book is a treatise on the theory of ethics, very popular during the.", "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",]

    let colorArr: [Int] = []

    @IBAction func showAnotherFact(_ sender: UIButton) {
        let number = Int.random(in: 0..<6)
        factTextLabel.text = textArr[number]
    }
    
    @IBAction func changeBgColor(_ sender: UIButton) {
    }
    
}

