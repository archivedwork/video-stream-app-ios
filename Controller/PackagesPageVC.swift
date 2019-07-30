//
//  PackagesPageVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 4/30/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class PackagesPageVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var arrayOfImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfImages = [#imageLiteral(resourceName: "light"), #imageLiteral(resourceName: "economy"),#imageLiteral(resourceName: "Active") ,#imageLiteral(resourceName: "standard") , #imageLiteral(resourceName: "Playstation"), #imageLiteral(resourceName: "Business"), #imageLiteral(resourceName: "BusinessPlus"), #imageLiteral(resourceName: "VIP")]
        
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        
        // register cell
        self.CollectionView.register(UINib(nibName: "PackagesCell", bundle: nil), forCellWithReuseIdentifier: "PackagesCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    

    @IBAction func BackActionBtn(_ sender: Any) {
        
        //  previous view controller
        navigationController?.popViewController(animated: true)
        // root view controller
        // navigationController?.popToRootViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayOfImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PackagesCell", for: indexPath) as! PackagesCell
        
        cell.setData(image: arrayOfImages[indexPath.row])
        
        return cell
    }

}
