//
//  CustomTableViewCell.swift
//  fansAreas
//
//  Created by lisz on 2017/2/27.
//  Copyright © 2017年 lisz. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lableQuyu: UILabel!
    @IBOutlet weak var lableShengfen: UILabel!
    @IBOutlet weak var lableName: UILabel!
    
    @IBOutlet weak var imageSimple: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
