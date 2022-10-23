//
//  ViewController.swift
//  UICollectionView
//
//  Created by Pankaj Verma on 23/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slide), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func slide() {
        let lastItem = collectionView.indexPathsForVisibleItems.last
       
        let currentItem = IndexPath(item: lastItem!.item, section: 0)
        print(currentItem)
        collectionView.scrollToItem(at: currentItem, at: .right, animated: false)
        var nextItem = currentItem.item + 1
        if nextItem == 50  {
            nextItem = 0
        }
        let nextIndexPath = IndexPath(item: nextItem, section: 0)
        collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: false)
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: UIImage(imageLiteralResourceName: "image"))
        return cell
    }
    
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
 


