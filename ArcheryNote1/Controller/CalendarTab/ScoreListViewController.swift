//
//  ScoreListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var scoreTableCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // card settings
        cardView.layer.cornerRadius = 20.0
        
        // collection view settings
        scoreTableCollectionView.delegate = self
        scoreTableCollectionView.dataSource = self
        scoreTableCollectionView.backgroundColor = .white
        
        let nib = UINib(nibName: "ScoreCollectionViewCell", bundle: .main)
        scoreTableCollectionView.register(nib, forCellWithReuseIdentifier: "scoreCell")
        
        let layout = UICollectionViewFlowLayout()
        let cellSize = scoreTableCollectionView.frame.width / 10
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.scoreTableCollectionView?.setCollectionViewLayout(layout, animated: true)
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let size: CGFloat = floor(collectionView.frame.size.width / 10.0)
//        print(collectionView.frame.size.width)
//        return CGSize(width: size, height: size)
//    }
//
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
//    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scoreCell", for: indexPath) as! ScoreCollectionViewCell
        
        if indexPath.section == 0{
            cell.label.text = String(indexPath.row)

        }else{
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 0.5
        }
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "toTarget", sender: nil)
    }
    
    
    
}
