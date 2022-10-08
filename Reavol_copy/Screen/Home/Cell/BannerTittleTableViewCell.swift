//
//  BannerTittleTableViewCell.swift
//  Reavol_copy
//
//  Created by bùi thành công on 07/10/2022.
//

import UIKit

class BannerTittleTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle2: UILabel!
    @IBOutlet weak var lbTitle1: UILabel!
    @IBOutlet weak var ivBanner: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
