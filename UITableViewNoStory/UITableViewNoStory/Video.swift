//
//  TableViewCell.swift
//  UITableViewNoStory
//
//  Created by Pankaj Verma on 23/10/22.
//

import UIKit

class Video {
    var imageView: UIImage
    var videoLabel: String
    var isOpen: Bool
    
    init(image: UIImage, label: String) {
        self.imageView = image
        self.videoLabel = label
        self.isOpen = true
    }
   
    
}
