//
//  VideoListVC.swift
//  UITableViewNoStory
//
//  Created by Pankaj Verma on 23/10/22.
//

import UIKit

class VideoListVC: UIViewController {
    var tableView = UITableView()
    var videos: [Video] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Videos";
        fetchVideo()
        configureTableView()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchVideo() {
        let video = Video(image: UIImage(imageLiteralResourceName: "image"), label: "Image 1")
        videos.append(video)
        videos.append(video)
        videos.append(video)
        videos.append(video)
        videos.append(video)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        // set delegate
        setTableViewDelegates()
        // set height
        tableView.rowHeight = 100
        // register cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
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

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell, for: indexPath) as! VideoCell
        if(indexPath.row == 0) {
            cell.setVideo(video: videos[indexPath.row])
        } else {
            cell.setVideo(video: Video(image: UIImage(imageLiteralResourceName: "image"), label: "Subsection"))
        }
      
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.row == 0) {
            videos[indexPath.row].isOpen = !videos[indexPath.row].isOpen
            tableView.reloadSections([indexPath.row], with: .none)
        } else {
            print("tapped sub cell")
        }
       
    }
    
}
