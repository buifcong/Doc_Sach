//
//  DetaiBookHeaderTableViewCell.swift
//  Reavol_copy
//
//  Created by bùi thành công on 08/10/2022.
//

import UIKit

class DetaiBookHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var ivTittle: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    var handleBack:(() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func actionBack(_ sender: Any) {
        handleBack?()
    }
    var item: DetailBookResponse? {
        didSet{
            if let url = item?.media?.originUrl {
                ivTittle.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
            }
            lbTitle.text = item?.name
        }
    }
}
