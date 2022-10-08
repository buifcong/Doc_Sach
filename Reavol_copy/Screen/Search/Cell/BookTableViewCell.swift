//
//  BookTableViewCell.swift
//  Reavol_copy
//
//  Created by bùi thành công on 05/10/2022.
//

import UIKit
import SDWebImage
class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbNameBook: UILabel!
    @IBOutlet weak var ivBook: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    var item: BookResponse? {
        didSet{
            lbAuthor.text = item?.author
            lbTitle.text = item?.subTitle
            lbNameBook.text = item?.title
            if let url = item?.media?.thumbUrl {
                ivBook.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
            }
            
        }
    }
   
}
