//
//  ScoreList4ViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/09.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreList4ViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var scoreTableCollectionView: UICollectionView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    @IBOutlet weak var sightTextField1: UITextField!
    
    @IBOutlet weak var sightTextField2: UITextField!
    
    @IBOutlet weak var sightTextField3: UITextField!
    
    @IBOutlet weak var sightTextField4: UITextField!
    
    
    @IBOutlet weak var sumLabel: UILabel!
    
    
    
    
    var intScoreSavingList = [[[Int]]]()
    var stringScoreSavingList = [[[String]]]()
    var pointXScoreSavingList = [[[Double]]]()
    var pointYScoreSavingList = [[[Double]]]()
    
    var round: Int = 1
    var end: Int = 1
    var thisEndStringPoints =  [String]()
    var thisEndIntPoints = [Int]()
    var thisEndLocation =  [[Double]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeScoreList()
        
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
    
    
    
    func initializeScoreList() {
        for _ in 0..<4{
            var intSubList =  [[Int]]()
            var stringSubList = [[String]]()
            var pointSubList = [[Double]]()
            for _ in 0..<6 {
                let intSubSubList: [Int] = [0, 0, 0, 0, 0, 0]
                let stringSubSubList: [String] = ["", "", "", "", "", ""]
                let pointSubSubList: [Double] = [0, 0, 0, 0, 0, 0]
                intSubList.append(intSubSubList)
                stringSubList.append(stringSubSubList)
                pointSubList.append(pointSubSubList)
            }
            intScoreSavingList.append(intSubList)
            stringScoreSavingList.append(stringSubList)
            pointXScoreSavingList.append(pointSubList)
            pointYScoreSavingList.append(pointSubList)
        }
        
    }
    
    
    
    // number of row
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7 * 4
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
        
        cell.setScorePageCell(scoreTableNum: 4, indexPath: indexPath, stringScoreList: stringScoreSavingList)
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath.row == 9{
            round = Int(floor(Double(indexPath.section / 7)))
            end = indexPath.section % 7 - 1
            print(round, end)
            thisEndStringPoints = stringScoreSavingList[round][end]
            thisEndIntPoints = intScoreSavingList[round][end]
            thisEndLocation = [pointXScoreSavingList[round][end], pointYScoreSavingList[round][end]]
            performSegue(withIdentifier: "toTargetFromS4", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTargetFromS4" {
            let VC = segue.destination as! TargetViewController
            VC.end = end
            VC.round = round
            VC.pointsStringList = thisEndStringPoints
            VC.pointsIntList = thisEndIntPoints
            VC.pointsLocationListX = thisEndLocation[0]
            VC.pointsLocationListY = thisEndLocation[1]
        }
    }
    
    
    
    
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "toTargetFromS4", sender: nil)
    }
    
    
    
    
}
