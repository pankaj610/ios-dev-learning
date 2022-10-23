//
//  VideoCell.swift
//  UITableViewNoStory
//
//  Created by Pankaj Verma on 23/10/22.
//

import UIKit

class VideoCell: UITableViewCell {

    var videoImageView = UIImageView()
    var videoTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        configureImageView()
        configurableTitleLabel()
        setImageConstraints()
        setLabelConstraints()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setVideo(video: Video) {
        self.videoImageView.image = video.imageView
        self.videoTitleLabel.text = video.videoLabel
    }
    
    func configureImageView() {
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    
    func configurableTitleLabel() {
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 1/1).isActive = true
    }
    
    func setLabelConstraints() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 10).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

}
