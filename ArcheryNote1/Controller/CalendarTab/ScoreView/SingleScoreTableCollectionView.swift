//
//  SingleScoreTableCollectionView.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class SingleScoreTableCollectionView: UIView, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        // set nib
        let nib = UINib(nibName: "ScoreCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "scoreCell")
        
        // layout
        let layout = UICollectionViewFlowLayout()
        let cellSize = collectionView.frame.width / 10
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.collectionView?.setCollectionViewLayout(layout, animated: true)
    }
    
    func loadNib() {
        //CustomViewの部分は各自作成したXibの名前に書き換えてください
        let view = Bundle.main.loadNibNamed("SingleScoreTableCollectionView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    
    // number of row
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
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
            
            if indexPath.section == 0 {
                
                switch indexPath.row {
                case 0, 9:
                    break
                case 7:
                    cell.label.text = "小計"
                    cell.label.font = UIFont.systemFont(ofSize: 12)
                case 8:
                    cell.label.text = "計"
                    cell.label.font = UIFont.systemFont(ofSize: 12)
                default:
                    cell.label.text = String(indexPath.row)
                }

            }else{
                switch indexPath.row {
                case 0:
                    cell.label.text = String(indexPath.section)
                case 9:
    //                cell.button.setImage(UIImage(systemName: "pencil"), for: .normal)
    //                cell.button.backgroundColor = .red
                    cell.button.setImage(UIImage(named: "target1"), for: .normal)
                default:
                    cell.backgroundColor = .white
                    cell.layer.borderColor = UIColor.black.cgColor
                    cell.layer.borderWidth = 0.5
                }
            }
            return cell
        }
    
    
    

}
