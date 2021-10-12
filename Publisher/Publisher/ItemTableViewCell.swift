//
//  ItemTableViewCell.swift
//  Publisher
//
//  Created by Amber on 10/12/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var authorLbl: UILabel!
    
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var creatTimeLbl: UILabel!
    
    @IBOutlet weak var articleTextView: UITextView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
