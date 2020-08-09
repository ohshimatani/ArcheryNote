//
//  ScoreList2ViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/09.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreList2ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var scoreTableCollectionView: UICollectionView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    @IBOutlet weak var sightTextField1: UITextField!
    
    @IBOutlet weak var sightTextField2: UITextField!
    
    @IBOutlet weak var sightTextField3: UITextField!
    
    @IBOutlet weak var sightTextField4: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // card settings
        //        cardView = SingleScoreTableCollectionView()
        cardView.layer.cornerRadius = 12.0
        
        
        // delegate settings
        scoreTableCollectionView.delegate = self
        scoreTableCollectionView.dataSource = self
        scoreTableCollectionView.backgroundColor = .white


        // set nib
        let nib = UINib(nibName: "ScoreCollectionViewCell", bundle: .main)
        scoreTableCollectionView.register(nib, forCellWithReuseIdentifier: "scoreCell")
        
        // collection view and its cell layout
        let layout = UICollectionViewFlowLayout()
        let cellSize = scoreTableCollectionView.frame.width / 10
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.scoreTableCollectionView?.setCollectionViewLayout(layout, animated: true)

                
                
        
        
        
        
    }
    
    
    
    // number of row
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7 * 2
    }


    // number of column
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scoreCell", for: indexPath) as! ScoreCollectionViewCell
        
        cell.setScorePageCell(scoreTableNum: 2, indexPath: indexPath)
        
        return cell
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}
