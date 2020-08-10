//
//  ScoreList2ViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/09.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreList2ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ScoreFromTargetDelegate, FromDistancePageDelegate {
    
    
    
    
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
    
    var distanceText: String = "フリー（72射）"
    var distanceKey: String = "free72"
    
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        var sum: Int = 0
        for i in 0..<2 {
            for j in 0..<6 {
                sum += intScoreSavingList[i][j].reduce(0, +)
            }
        }
        sumLabel.text = String(sum)
        sumLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        
        distanceLabel.text = distanceText
    }
    
    
    
    func initializeScoreList() {
        for _ in 0..<2{
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
        return 8 * 2
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
        
        cell.setScorePageCell(scoreTableNum: 2, indexPath: indexPath, stringScoreList: stringScoreSavingList, intScoreList: intScoreSavingList)
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if (indexPath.section % 8 != 7) && ((indexPath.row == 8) || (indexPath.row == 9)){
            round = Int(floor(Double(indexPath.section / 8)))
            end = indexPath.section % 8 - 1
            print("tap !!! : ", round, end)
            thisEndStringPoints = stringScoreSavingList[round][end]
            thisEndIntPoints = intScoreSavingList[round][end]
            thisEndLocation = [pointXScoreSavingList[round][end], pointYScoreSavingList[round][end]]
            performSegue(withIdentifier: "toTargetFromS2", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTargetFromS2" {
            let VC = segue.destination as! TargetViewController
            VC.end = end
            VC.round = round
            VC.pointsStringList = thisEndStringPoints
            VC.pointsIntList = thisEndIntPoints
            VC.pointsLocationListX = thisEndLocation[0]
            VC.pointsLocationListY = thisEndLocation[1]
            var n: Int = 1
            for str in thisEndStringPoints {
                if str == "" {
                    break
                }
                n += 1
            }
            VC.nowSelect = n
            VC.delegate = self
        } else if segue.identifier == "toDistanceFromS2" {
           let VC = segue.destination as! ChoiceDistanceViewController
            VC.intScoreSavingList = intScoreSavingList
            VC.stringScoreSavingList = stringScoreSavingList
            VC.pointXScoreSavingList = pointXScoreSavingList
            VC.pointYScoreSavingList = pointYScoreSavingList
            VC.labelText = distanceText
            VC.selectedKey = distanceKey
            VC.delegate = self
       }
    }
    
    func scoreFromTarget(round: Int, end: Int, pointInt: [Int], pointString: [String], locationX: [Double], locationY: [Double]) {
        intScoreSavingList[round][end] = pointInt
        stringScoreSavingList[round][end] = pointString
        pointXScoreSavingList[round][end] = locationX
        pointYScoreSavingList[round][end] = locationY
        scoreTableCollectionView.reloadData()
    }
    
    
    func fromDistancePage(intScoreSavingList: [[[Int]]], stringScoreSavingList: [[[String]]], pointXScoreSavingList: [[[Double]]], pointYScoreSavingList: [[[Double]]], distanceKey: String, distanceText: String) {
        self.intScoreSavingList = intScoreSavingList
        self.stringScoreSavingList = stringScoreSavingList
        self.pointXScoreSavingList = pointXScoreSavingList
        self.pointYScoreSavingList = pointYScoreSavingList
        self.distanceText = distanceText
        self.distanceKey = distanceKey
        scoreTableCollectionView.reloadData()
    }
    
    
    @IBAction func changeDistance(_ sender: Any) {
        performSegue(withIdentifier: "toDistanceFromS2", sender: nil)
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
}
