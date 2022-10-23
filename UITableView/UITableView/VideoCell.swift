//
//  VideoCell.swift
//  UITableView
//
//  Created by Pankaj Verma on 23/10/22.
//

import UIKit

class VideoCell: UITableViewCell {
    @IBOutlet weak var videoImageView: UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    
    func setVideo(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
}
