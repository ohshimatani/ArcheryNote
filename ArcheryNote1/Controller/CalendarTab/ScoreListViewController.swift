//
//  ScoreListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource, UIToolbarDelegate {
    
    
    
    
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var scoreTableCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var distanceChangeButton: UIButton!
    
    @IBOutlet weak var sightTextField1: UITextField!
    @IBOutlet weak var sightTextField2: UITextField!
    @IBOutlet weak var sightTextField3: UITextField!
    @IBOutlet weak var sightTextField4: UITextField!
    
    
    
    var distancePickerView: UIPickerView!
    var distanceToolBar: UIToolbar!
    
    let distanceList = ["70mW", "ショートハーフ5030", "1440ラウンド"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // card settings
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
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return distanceList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return distanceList[row]
    }
    
    
    @IBAction func distanceWillChange(_ sender: Any) {
        
        // picker view
        distancePickerView = UIPickerView()
        
        distancePickerView.delegate = self
        distancePickerView.dataSource = self
        let vi = UIView(frame: distancePickerView.bounds)
        vi.backgroundColor = .red
        let pickerViewRect = CGRect(x: 0, y: self.view.frame.height * 0.7 , width: self.view.frame.width, height: self.view.frame.height * 0.3)
        distancePickerView.frame = pickerViewRect
        vi.addSubview(distancePickerView)
        
        // tool bar
        distanceToolBar = UIToolbar()
        distanceToolBar.barStyle = .default
        distanceToolBar.isTranslucent = true
        distanceToolBar.backgroundColor = .black
        let toolBarButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: Selector(("didCilckToolBarButton")))
        distanceToolBar.items = [toolBarButton]
        distanceToolBar.sizeToFit()
        vi.addSubview(distanceToolBar)
        distanceToolBar.delegate = self
        
        view.addSubview(vi)
        let screenSize = UIScreen.main.bounds.size
        vi.frame.origin.y = screenSize.height
        UIView.animate(withDuration: 0.3) {
            vi.frame.origin.y = screenSize.height - vi.bounds.size.height
        }
        
    }
    
    
    
    
    
    
    @IBAction func toNext(_ sender: Any) {
        performSegue(withIdentifier: "toTarget", sender: nil)
    }
    
    
    
}
