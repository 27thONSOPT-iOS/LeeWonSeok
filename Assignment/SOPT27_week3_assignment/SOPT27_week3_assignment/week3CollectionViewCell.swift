//
//  week3CollectionViewCell.swift
//  SOPT27_week3_assignment
//
//  Created by 이원석 on 2020/11/06.
//

import UIKit

class week3CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "week3CollectionViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var leaderImageView: UIImageView!
    @IBOutlet weak var contentstextView: UITextView!
    
    func setUserData(name: String, imageName: String, contents: String) {
        
        self.nameLabel.text = name
        self.leaderImageView.image = UIImage(named: imageName)
        self.contentstextView.text = contents
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "week3CollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
    }
    
}
