//
//  EmptyAlertTableViewCell.swift
//  iOsPrueba
//
//  Created by JOAQUIN DIAZ RAMIREZ on 10/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit


protocol EmptyAlertCellDelegate: class {
    func emptyStatusCellDidPressBack(cell: EmptyAlertTableViewCell)
}
class EmptyAlertTableViewCell: UITableViewCell {
    @IBOutlet  weak var btnVolver : UIButton!
    @IBOutlet weak var viewBack : UIView!
    
    weak var delegate: EmptyAlertCellDelegate?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnVolver.layer.cornerRadius = 10.0
        btnVolver.layer.masksToBounds = true
        viewBack.layer.cornerRadius = 10.0
        viewBack.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func eventoClickVolver()  {
        
        delegate?.emptyStatusCellDidPressBack(cell: self)    }
}
