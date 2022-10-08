//
//  DetailBookTableViewCell.swift
//  Reavol_copy
//
//  Created by bùi thành công on 08/10/2022.
//

import UIKit

class DetailBookTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTittle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbNameBook: UILabel!
    @IBOutlet weak var ivBook: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var article: Articles? {
        didSet{
            lbAuthor.text = article?.author
            lbTittle.text = article?.subTitle
            lbNameBook.text = article?.title
            ivBook.loadImage(url: article?.media?.originUrl)
        }
    }
    var item: BookResponse? {
        didSet{
            lbAuthor.text = item?.author
            lbTittle.text = item?.subTitle
            lbNameBook.text = item?.title
            if let url = item?.media?.thumbUrl {
                ivBook.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
            }
        }
    }
}
