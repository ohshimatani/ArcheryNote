//
//  TrainingListTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class TrainingListTableViewCell: UITableViewCell {

    @IBOutlet weak var trainingTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let width: CGFloat = self.bounds.width
//        let height: CGFloat = self.bounds.height
//
//        trainingTitle.frame.origin.x += 15.0
//        trainingTitle.frame.origin.y += 15.0
//        trainingTitle.frame = CGRect(x: trainingTitle.frame.origin.x, y: trainingTitle.frame.origin.x, width: width - 30.0, height: height - 30.0)
//        trainingTitle.textAlignment = NSTextAlignment.center
//        trainingTitle.textColor = UIColor.black
//        trainingTitle.font = UIFont(name: "", size: 25)
//        self.addSubview(trainingTitle)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
