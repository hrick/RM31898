//
//  CervejaTableViewCell.swift
//  RM31898
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 FiapAluno. All rights reserved.
//

import UIKit

class CervejaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblTeor: UILabel!
    @IBOutlet weak var ivCerveja: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
