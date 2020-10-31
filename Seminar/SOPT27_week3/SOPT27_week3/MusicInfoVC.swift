//
//  MusicInfoVC.swift
//  study_TableView
//
//  Created by 이원석 on 2020/10/31.
//

import UIKit

class MusicInfoVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicInfo()
        // Do any additional setup after loading the view.
    }
    
    func setMusicInfo() {
        if let music = music {
            titleLabel.text = music.title
            singerLabel.text = music.singer
            albumImageView.image = music.makeAlbumImage()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
