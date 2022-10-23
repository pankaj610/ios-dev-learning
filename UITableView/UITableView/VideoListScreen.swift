//
//  VideoListScreen.swift
//  UITableView
//
//  Created by Pankaj Verma on 23/10/22.
//

import UIKit

class VideoListScreen: UIViewController {
    var videos: [Video] = []
    @IBOutlet weak var tableVideo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos = createArray()
         
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Video] {
        var tempVideos: [Video] = []
        var video1 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 1")
        var video2 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 2")
        var video3 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 3")
        var video4 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 4")
        var video5 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 5")
//        var video2 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 2")
//        var video3 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 3")
//        var video4 = Video(image: UIImage(imageLiteralResourceName: "videoImg"), title: "Video 4")
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        
        return tempVideos
    }
    

}

extension VideoListScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        
        return cell
    }
}
