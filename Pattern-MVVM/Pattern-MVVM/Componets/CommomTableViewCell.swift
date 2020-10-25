//
//  CommomTableViewCell.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import UIKit
import Kingfisher
class CommomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCalendar.layer.cornerRadius = 13
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var viewCalendar: UIView!
    func setDate(_ date: Int){
        let milisecond = date
        let dateVar = Date.init(timeIntervalSinceNow: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd\nMMM"
        let datefinal  = dateFormatter.string(from: dateVar)
        self.eventDate.text = datefinal
    }
    
    
  
}
