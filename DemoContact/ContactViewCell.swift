//
//  ContactViewCell.swift
//  DemoContact
//
//  Created by Rifluxyss on 01/02/23.
//

import UIKit

class ContactViewCell: UITableViewCell {

    @IBOutlet weak var InputNameLabel: UILabel!
    @IBOutlet weak var InputNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
