//
//  TvPageVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 4/29/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import CoreData

class TvPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    let dataArray = ["الرياضية", "المسلسلات", "الافلام", "الوثائقيات", "الاطفال", "الترفيهية"]
    
    var arrayOfImage = [UIImage]()
    var myInt = Int()
    
    var arrayOfID = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayOfImage = [#imageLiteral(resourceName: "sport-wallpaper"), #imageLiteral(resourceName: "tvseries-wallpaper"), #imageLiteral(resourceName: "popcorn-movie"), #imageLiteral(resourceName: "documentry-wall"), #imageLiteral(resourceName: "smurf-wall"), #imageLiteral(resourceName: "entertainment-wall")]
        // Do any additional setup after loading the view.
        // register cell
        self.TableView.register(UINib(nibName: "TvTableViewCell", bundle: nil), forCellReuseIdentifier: "TvTableViewCell")
        
        
        arrayOfID = ["SportVC", "SeriesTV", "MoviesTvVC", "DocumentaryTvVC", "KidsTvVC", "EntertainmentTvVC"]
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TvTableViewCell", for: indexPath) as! TvTableViewCell
        cell.setTableData(text: self.dataArray[indexPath.row], image: self.arrayOfImage[indexPath.row])
        
       
        return cell
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myInt = indexPath.row
        print(self.myInt)
        let name = self.arrayOfID[indexPath.row]
        let VC = self.storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(VC!, animated: true)
    }

}








extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
