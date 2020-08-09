//
//  TargetViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/05.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class TargetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    
    @IBOutlet weak var targetView: TargetCustomView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var centerOfTarget: CGPoint = CGPoint(x: 385.0, y: 385.0)
    
    var pointString: String = ""
    var pointInt: Int = 0
    var dotLocation : CGPoint = CGPoint(x: 0, y: 0)
    var pointsStringList: [String] = ["", "", "", "", "", ""]
    var pointsIntList: [Int] = [0, 0, 0, 0, 0, 0]
    var pointsLocationList: [CGPoint] = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 0)]
    
    var nowSelect: Int = 1
    
    var dot1 = UIView()
    var dot2 = UIView()
    var dot3 = UIView()
    var dot4 = UIView()
    var dot5 = UIView()
    var dot6 = UIView()
    var dotViewList = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dotViewList.append(dot1)
        dotViewList.append(dot2)
        dotViewList.append(dot3)
        dotViewList.append(dot4)
        dotViewList.append(dot5)
        dotViewList.append(dot6)
        
        centerOfTarget = CGPoint(x: targetView.frame.width/2, y: targetView.frame.height/2)
        
        
        let buttonList = [targetView.buttonX, targetView.button10, targetView.button9, targetView.button8, targetView.button7, targetView.button6,  targetView.button5, targetView.button4, targetView.button3, targetView.button2, targetView.button1, targetView.buttonM]
        
        
//        targetView.buttonX.addTarget(self, action: #selector(didTapX(sender:forEvent:)), for: .touchUpInside)
        
        for button in buttonList {
            button?.addTarget(self, action: #selector(didTap(sender:forEvent:)), for: .touchUpInside)
        }
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // set nib
        let nib = UINib(nibName: "ScoreCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "scoreCell")
        
        // collection view and its cell layout
        let layout = UICollectionViewFlowLayout()
        let cellSize = collectionView.frame.width / 10
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.collectionView?.setCollectionViewLayout(layout, animated: true)
        
        collectionView.backgroundColor = .white
        
        
        
    }
    
    @objc func didTap(sender: UIButton, forEvent event: UIEvent) {
        if nowSelect > 6 {
            return
        } else {
            (pointString, pointInt, dotLocation) = getLocation(sender: sender, event: event)
            appendPoint(pointString: pointString, pointInt: pointInt, dotLocation: dotLocation)
            nowSelect += 1
        }
        collectionView.reloadData()
        print(pointString, pointInt, dotLocation)
        print(pointsIntList)
    }
    
    func appendPoint(pointString: String, pointInt: Int, dotLocation: CGPoint){
        pointsStringList[nowSelect-1] = pointString
        pointsIntList[nowSelect-1] = pointInt
        pointsLocationList[nowSelect-1] = dotLocation
    }
    
    
    func getLocation(sender: UIButton, event: UIEvent) -> (String, Int, CGPoint) {
        print(sender)
        var dotPoint: CGPoint!
        var _pointString: String = "0"
        var _pointInt: Int = 0
        if let location = event.touches(for: sender)?.first?.location(in: self.targetView) {
            print(location)
            (_pointString, _pointInt) = judgePoint(location: location)
            dotPoint = location
        }else{
            return (_pointString, _pointInt, CGPoint(x: 0, y: 0))
        }
        addDot(sender: sender, point: dotPoint)
        return (_pointString, _pointInt, dotPoint)
    }
    
    func addDot(sender: UIButton, point: CGPoint){
        let dot = UIView()
        let rad: CGFloat = 8
        dot.frame = CGRect(x: point.x - rad/2, y: point.y - rad/2, width: rad, height: rad)
        dot.backgroundColor = .black
        dot.layer.borderColor = UIColor.white.cgColor
        dot.layer.borderWidth = 0.5
        dot.layer.cornerRadius = rad/2
        dot.tag = nowSelect
        self.targetView.addSubview(dot)
    }
    
    
    
    
    func judgePoint(location: CGPoint) -> (String, Int) {
        let distance = sqrt(pow(centerOfTarget.x - location.x, 2) + pow(centerOfTarget.y - location.y, 2))
        print(distance)
        let rad: CGFloat = 30
        if distance < 15 + 4 {
            return ("X", 10)
        } else if distance < rad * 1 + 4 {
            return ("10", 10)
        } else if distance < rad * 2 + 4 {
            return ("9", 9)
        } else if distance < rad * 3 + 4 {
            return ("8", 8)
        } else if distance < rad * 4 + 4 {
            return ("7", 7)
        } else if distance < rad * 5 + 4 {
            return ("6", 6)
        } else if distance < rad * 6 + 4 {
            return ("5", 5)
        } else if distance < rad * 7 + 4 {
            return ("4", 4)
        } else if distance < rad * 8 + 4 {
            return ("3", 3)
        } else if distance < rad * 9 + 4 {
            return ("2", 2)
        } else if distance < rad * 10 + 4 {
            return ("1", 1)
        } else {
            return ("M", 0)
        }
    }
    
    
    // number of row
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // number of column
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    // cell for item at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scoreCell", for: indexPath) as! ScoreCollectionViewCell
        cell.setTargetPageCell(indexPath: indexPath, pointsStringList: pointsStringList, pointsIntList: pointsIntList, nowSelect: nowSelect)
        return cell
    }
    
    
    
    @IBAction func done(_ sender: Any) {
        let realm = try! Realm()
        let thisEndPointList = PointsOneEndList()
        let pointOneEnd = PointOneEnd()
        for index in 0..<6{
            pointOneEnd.pointString = pointsStringList[index]
            pointOneEnd.pointInt = pointsIntList[index]
            pointOneEnd.dotLocationX = Double(pointsLocationList[index].x)
            pointOneEnd.dotLocationY = Double(pointsLocationList[index].y)
            thisEndPointList.points.append(pointOneEnd)
        }
        try! realm.write {
            realm.add(thisEndPointList)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func cencel(_ sender: Any) {
        if nowSelect > 1 {
            pointsStringList[nowSelect-2] = ""
            pointsIntList[nowSelect-2] = 0
            pointsLocationList[nowSelect-2] = CGPoint(x: 0, y: 0)
            targetView.viewWithTag(nowSelect-1)!.removeFromSuperview()
            nowSelect -= 1
            collectionView.reloadData()
        }
    }
    
    
    
}


