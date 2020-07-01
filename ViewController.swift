//
//  ViewController.swift
//  ExcitedCowSticker
//
//  Created by Summer on 2020/7/1.
//  Copyright © 2020 Summer. All rights reserved.
//

import UIKit
let BarHeight: CGFloat = 40.0
let tabViewHeight: CGFloat = 40.0

let kUIScreenWidth = UIScreen.main.bounds.size.width
let kUIScreenHeight = UIScreen.main.bounds.size.height
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "StickerCells", for: indexPath) as? StickerCell {
            cell.configContentView(iconString: "Sticker 1", titleString: "")
            return cell
        }
        return UITableViewCell()
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    var mainTableview = UITableView()
    
    var stickers = NSArray()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        
        let viewHeight: CGFloat = UIScreen.main.bounds.size.height
        
        let heage = navHeight()
        
        let frame = CGRect.init(x: 0, y:CGFloat(heage), width: kUIScreenWidth, height: kUIScreenHeight-CGFloat(heage))
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableview.frame = CGRect(x: 0, y: 0, width: kUIScreenWidth, height: kUIScreenHeight)
        mainTableview.delegate = self
        mainTableview.dataSource = self
        mainTableview.register(StickerCell.self, forCellReuseIdentifier: "StickerCells")
//        self.view.addSubview(mainTableview)
        
        self.loadData()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         collectionView.showsVerticalScrollIndicator = false
         collectionView.register(StickersCell.self, forCellWithReuseIdentifier: NSStringFromClass(StickersCell.self))
         collectionView.dataSource = self
         collectionView.delegate = self
         self.view.addSubview(collectionView)
         if #available(iOS 11.0, *) {
             collectionView.contentInsetAdjustmentBehavior = .never
         }
        
        collectionView.reloadData()
    }

    public func loadData() {
        stickers = ["Sticker 1","Sticker 2","Sticker 3","Sticker 4","Sticker 5","Sticker 6","Sticker 7","Sticker 8","Sticker 9","Sticker 10","Sticker 11","Sticker 12","Sticker 13","Sticker 14","Sticker 15"]
    }
    
    
    let IS_IPHONE_X =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)

    func navHeight() -> Float {
        
        var navh: Float = 44.0

        if #available(iOS 12.0, *) {
            navh += Float((UIApplication.shared.delegate?.window?!.safeAreaInsets.top)!)
        }else if IS_IPHONE_X {
            if #available(iOS 11.0, *) {
                navh += Float((UIApplication.shared.delegate?.window?!.safeAreaInsets.top)!)
            } else {
                // Fallback on earlier versions
                navh += 20
            }
        }else{
            navh += Float(UIApplication.shared.statusBarFrame.size.height)
        }
        return navh
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stickers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(StickersCell.self), for: indexPath) as? StickersCell {
            cell.configView(titleString: (stickers[indexPath.row] as! NSString))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath)
        
        let image = UIImage(named: stickers[indexPath.row] as! String)
        let activityVC = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (UIScreen.main.bounds.size.width - 40) / 2, height: (UIScreen.main.bounds.size.width - 40) / 2)
        return size
    }
    
    
    
    
}
