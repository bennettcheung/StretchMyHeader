//
//  HeadlineTableViewCell.swift
//  StretchMyHeader
//
//  Created by Bennett on 2018-09-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

  @IBOutlet weak var headlineLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      categoryLabel.addObserver(self, forKeyPath: "text", options: [.old, .new], context: nil)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "text", let newText = change?[.newKey] as? String{
      var textColor:UIColor = UIColor.black
      switch newText {
        case NewsItemCategory.Americas.rawValue:
          textColor = UIColor.red
        case NewsItemCategory.World.rawValue:
          textColor = UIColor.blue
        case NewsItemCategory.Europe.rawValue:
          textColor = UIColor.green
        case NewsItemCategory.MiddleEast.rawValue:
          textColor = UIColor.yellow
        case NewsItemCategory.Africa.rawValue:
          textColor = UIColor.orange
      case NewsItemCategory.AsiaPacific.rawValue:
          textColor = UIColor.purple
        default:
          textColor = UIColor.black
      }
      categoryLabel.textColor = textColor
    }
  }

}
