//
//  TestTableViewCell.swift
//  ConstrainedLayout
//
//  Created by wangyahui on 2021/3/29.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(_ left: String, center: String, right: String) {
        leftLabel.text = left
        centerLabel.text = center
        rightLabel.text = right
        centerLabel.textAlignment = .right
        
        setNeedsLayout()
        layoutIfNeeded()
        let attributes = NSMutableAttributedString.init(string: center)
        let width = attributes.boundingRect(with: CGSize(width: 0, height: 16), options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil).size.width
        let rightLabelLeft = rightLabel.frame.origin.x - 10;
        let leftLableRight = leftLabel.frame.origin.x + leftLabel.frame.size.width + 20
        if (rightLabelLeft - leftLableRight) < width {
            centerLabel.textAlignment = .left
        }
        
    }
    
}
