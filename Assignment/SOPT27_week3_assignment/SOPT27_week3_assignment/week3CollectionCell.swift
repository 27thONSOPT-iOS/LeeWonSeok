//
//  week3CollectionCell.swift
//  SOPT27_week3_assignment
//
//  Created by 이원석 on 2020/11/03.
//

import UIKit

class week3CollectionCell: UICollectionViewCell {
    static var identifier = "week3CollectionCell"
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userContentsTextView: UITextView!

    func setUserData(name: String, imageName: String, contents: String) {
        
        self.userNameLabel.text = name
        self.userImageView.image = UIImage(named: imageName)
        self.userContentsTextView.text = contents
        
    }

}
