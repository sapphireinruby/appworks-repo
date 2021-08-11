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

    @IBOutlet var bgColor: UIView!
    
    override func viewDidLoad() {       super.viewDidLoad()
        factTextLabel.text = textArr[0]
    }
    
    
    let textArr: [String] = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.", "Contrary to popular belief, Lorem Ipsum is not simply random text.", "Richard McClintock, a Latin professor at Hampden-Sydney College in ", "looked up one of the more obscure Latin words, consectetur", "from a Lorem Ipsum passage, and going through the cities of the word", "This book is a treatise on the theory of ethics, very popular during the.", "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",]
    

    @IBAction func showAnotherFact(_ sender: UIButton) {
        let number = Int.random(in: 0..<7)
        factTextLabel.text = textArr[number]
    }
    

    
    let rainbowArr: [String] = ["#FF7CBBFF", "#FFA500FF", "#AD7DBDFF", "#71C56FFF", "#6DC1D3FF", "#77A1E0FF", "#7B61FFFF"]
   
    
    @IBAction func changeButtonFontColor(_ sender: UIButton) {
        let ind = Int.random(in: 0..<7)
        //self.view.backgroundColor = UIColor(hex: rainbowArr[ind])
        
        bgColor.backgroundColor = UIColor(hex: rainbowArr[ind])
        showAnotherFactButton.setTitleColor(UIColor(hex: rainbowArr[ind]), for: .normal)
        
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
