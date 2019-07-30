//
//  DeviceIPVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/7/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class DeviceIPVC: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    // Array for Label names and Images
    let dataArray = ["الأشتراكات", "موقع الشركة", "الأبراج","عن الشركة", "الأخبار", "اتصل بنا"]
    var arrayOfImages = [UIImage]()
    var arrayOfID = [String]()
    
    // Cell configuration
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfImages = [  #imageLiteral(resourceName: "packages"), #imageLiteral(resourceName: "location"), #imageLiteral(resourceName: "tower"), #imageLiteral(resourceName: "about"), #imageLiteral(resourceName: "news"), #imageLiteral(resourceName: "call")]
        arrayOfID = ["Packages", "Location", "Tower", "About", "News", "Contact"]
        // set delegates and datasource
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        
        
        // register cell
        self.CollectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        
        // setup gridView
        self.setupGridView()
    }
    
    
    // GridView Function
    func setupGridView(){
        let flow = CollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupGridView()
        
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    

   

}



extension DeviceIPVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(text: self.dataArray[indexPath.row], image: self.arrayOfImages[indexPath.row])
        
        return cell
        
    }
    
    // Handle Item selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
        let name = arrayOfID[indexPath.row]
        let VC = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
    
    
    
}




extension DeviceIPVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        print(width)
        return width
    }
}



