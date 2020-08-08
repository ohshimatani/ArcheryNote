//
//  ScoreListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var scoreTableCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreTableCollectionView.delegate = self
        scoreTableCollectionView.dataSource = self
        
        cardView.layer.cornerRadius = 20.0
//        cardView.layer.borderColor = .init(genericGrayGamma2_2Gray: 0.8, alpha: 1.0)
//        cardView.backgroundColor = .white
        
        scoreTableCollectionView.backgroundColor = .blue
        
        
        let collectionViewCellLayout = UICollectionViewFlowLayout()
        collectionViewCellLayout.itemSize = CGSize(width: 20.0, height: 20.0)
        collectionViewCellLayout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        scoreTableCollectionView.collectionViewLayout = collectionViewCellLayout
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "toTarget", sender: nil)
    }
    
    
    
}
