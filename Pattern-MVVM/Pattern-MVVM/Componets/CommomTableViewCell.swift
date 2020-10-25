//
//  CommomTableViewCell.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import UIKit

class CommomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
  
}
