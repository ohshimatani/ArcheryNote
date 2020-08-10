//
//  ScoreListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ScoreFromTargetDelegate, FromDistancePageDelegate {
    
    
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
    var distanceKey: String = "free_72"
    var isIndoor60: Bool = false
    var isIndoor30: Bool = false
    
    var roundsNum: Int = 2
    var sectionsNum: Int = 8
    
    var sum10Lists: [[Int]] = [[0, 0], [0, 0], [0, 0], [0, 0]]
    
    var memo: String = ""
    
    var distanceKeys: [String] = ["70m", "70m", "", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeScoreList()
        
        // card settings
        //        cardView = SingleScoreTableCollectionView()
        cardView.layer.cornerRadius = 12.0
        cardView.layer.borderColor = UIColor.systemGray.cgColor
        cardView.layer.borderWidth = 2.0
        
        
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
        var sum10List: [Int] = [0, 0]
        for i in 0..<roundsNum {
            var countX: Int = 0
            var count10: Int = 0
            for j in 0..<6 {
                sum += intScoreSavingList[i][j].reduce(0, +)
                var endCountX: Int = 0
                var endCount10: Int = 0
                for k in 0..<6 {
                    if stringScoreSavingList[i][j][k] == "X" {
                        endCountX += 1
                        endCount10 += 1
                    } else if stringScoreSavingList[i][j][k] == "10" {
                        endCount10 += 1
                    }
                }
                countX += endCountX
                count10 += endCount10
            }
            sum10List[0] = countX
            sum10List[1] = count10
            sum10Lists[i] = sum10List
        }
        sumLabel.text = String(sum)
        sumLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        
        distanceLabel.text = distanceText
        
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
    
    
    func generateDistanceKeys() {
        switch distanceKey {
        case "70W":
            distanceKeys[0] = "70m"
            distanceKeys[1] = "70m"
        case "50W":
            distanceKeys[0] = "50m"
            distanceKeys[1] = "50m"
        case "SH":
            distanceKeys[0] = "50m"
            distanceKeys[1] = "30m"
        case "1440M":
            distanceKeys[0] = "90m"
            distanceKeys[1] = "70m"
            distanceKeys[2] = "50m"
            distanceKeys[3] = "30m"
        case "1440W":
            distanceKeys[0] = "70m"
            distanceKeys[1] = "60m"
            distanceKeys[2] = "50m"
            distanceKeys[3] = "30m"
        case "60W":
            distanceKeys[0] = "60m"
            distanceKeys[1] = "60m"
        case "18W":
            distanceKeys[0] = "18m"
            distanceKeys[1] = "18m"
        case "30W":
            distanceKeys[0] = "30m"
            distanceKeys[1] = "30m"
        case "free_36"
        default:
            <#code#>
        }
    }
    
    
    
    // number of row
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if isIndoor60 || isIndoor30 {
            sectionsNum = 7
        } else {
            sectionsNum = 8
        }
        return sectionsNum * roundsNum
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
        
        cell.setScorePageCell(scoreTableNum: roundsNum, indexPath: indexPath, stringScoreList: stringScoreSavingList, intScoreList: intScoreSavingList, isIndoor60: isIndoor60, isIndoor30: isIndoor30, sum10Lists: sum10Lists, distanceKey: distanceKey)
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if ((indexPath.section % sectionsNum != sectionsNum-1) && (indexPath.section % sectionsNum != 0)) && ((indexPath.row == 8) || (indexPath.row == 9)){
            round = Int(floor(Double(indexPath.section / sectionsNum)))
            end = indexPath.section % sectionsNum - 1
            print("tap !!! : ", round, end)
            print(stringScoreSavingList)
            print(round, end)
            thisEndStringPoints = stringScoreSavingList[round][end]
            thisEndIntPoints = intScoreSavingList[round][end]
            thisEndLocation = [pointXScoreSavingList[round][end], pointYScoreSavingList[round][end]]
            performSegue(withIdentifier: "toTarget", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTarget" {
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
        } else if segue.identifier == "toDistance" {
            let VC = segue.destination as! ChoiceDistanceViewController
            VC.intScoreSavingList = intScoreSavingList
            VC.stringScoreSavingList = stringScoreSavingList
            VC.pointXScoreSavingList = pointXScoreSavingList
            VC.pointYScoreSavingList = pointYScoreSavingList
            VC.labelText = distanceText
            VC.selectedKey = distanceKey
            VC.delegate = self
        } else if segue.identifier == "toScoreDetail" {
            let VC = segue.destination as! AddScoreInformationMoreViewController
            VC.distanceText = distanceText
            VC.intScoreSavingList = intScoreSavingList
            VC.stringScoreSavingList = stringScoreSavingList
            VC.sum10Lists = sum10Lists
            VC.total = sumLabel.text!
            VC.memo = memo
        }
    }
    
    
    func scoreFromTarget(round: Int, end: Int, pointInt: [Int], pointString: [String], locationX: [Double], locationY: [Double]) {
        intScoreSavingList[round][end] = pointInt
        stringScoreSavingList[round][end] = pointString
        pointXScoreSavingList[round][end] = locationX
        pointYScoreSavingList[round][end] = locationY
        scoreTableCollectionView.reloadData()
    }
    
    
    func fromDistancePage(intScoreSavingList: [[[Int]]], stringScoreSavingList: [[[String]]], pointXScoreSavingList: [[[Double]]], pointYScoreSavingList: [[[Double]]], distanceKey: String, distanceText: String, rounds: Int, isIndoor30: Bool, isIndoor60: Bool) {
        self.intScoreSavingList = intScoreSavingList
        self.stringScoreSavingList = stringScoreSavingList
        self.pointXScoreSavingList = pointXScoreSavingList
        self.pointYScoreSavingList = pointYScoreSavingList
        self.distanceText = distanceText
        self.distanceKey = distanceKey
        self.roundsNum = rounds
        self.isIndoor60 = isIndoor60
        self.isIndoor30 = isIndoor30
        
        distanceLabel.text = distanceText
        scoreTableCollectionView.reloadData()
    }
    

    
    @IBAction func changeDistance(_ sender: Any) {
        performSegue(withIdentifier: "toDistance", sender: nil)
    }
    
    
    @IBAction func toScoreDetail(_ sender: Any) {
        performSegue(withIdentifier: "toScoreDetail", sender: nil)
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
}
