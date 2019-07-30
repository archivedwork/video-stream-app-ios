//
//  TowerVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/7/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import Alamofire

class TowerVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
  
    
    @IBOutlet weak var TableView: UITableView!
    
    //a list to store towers
    var towers = [Tower]()
    
    
    //variables
    var myInt = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.getTowerData()
        self.checkReachability()

        // register cell
        self.TableView.register(UINib(nibName: "TowerTableViewCell", bundle: nil), forCellReuseIdentifier: "TowerTableViewCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    
    @IBAction func BackActionBtn(_ sender: Any) {
        
        //  previous view controller
        navigationController?.popViewController(animated: true)
        // root view controller
        // navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return towers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TowerTableViewCell", for: indexPath) as! TowerTableViewCell
       
        //getting the tower for the specified position
        let tower: Tower
        tower = towers[indexPath.row]
        
        //displaying values
        cell.TowerNameLbl.text = tower.Title
        cell.OwnerMobileLbl.text = tower.phone
        
        return cell
    }
    
    
    // Check Network Connection
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
            
            getTowerData()
            
        }else if currentReachabilityStatus == .reachableViaWWAN{
            
            print("User is connected to the internet via WWAN.")
            getTowerData()
            
        } else {
            print("There is no internet connection")
            
            // Alert User for No Connection
            let alert = UIAlertController(title: "تعذر الاتصال", message: "يرجى التحقق من اتصالك بالانترنت", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            
                action2 in
                   print("Ok handler pressed")
                self.checkReachability()
            
            }))
            //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
        }
    }
    
    
    
    
    
    
    
    
    
    func getTowerData(){
        
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = self.view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        //myActivityIndicator.stopAnimating()
        
        
        self.view.addSubview(myActivityIndicator)
        
        
        
        //fetching data from web api
        Alamofire.request(TOWER_URL).responseJSON { response in
            
            //getting json
            if let json = response.result.value {
                print(json)
                //converting json to NSArray
                let towersArray : NSArray  = json as! NSArray
               // print(towersArray)
                //traversing through all elements of the array
                for i in 0..<towersArray.count{
                    
                    //adding hero values to the hero list
                    self.towers.append(Tower(
                        Title: (towersArray[i] as AnyObject).value(forKey: "Title") as? String,
                        phone: (towersArray[i] as AnyObject).value(forKey: "phone") as? String,
                        
                        Latitude: (towersArray[i] as AnyObject).value(forKey: "Latitude") as? String,
                        
                        longitude: (towersArray[i] as AnyObject).value(forKey: "longitude") as? String
                    ))
                    
                }
                // Call stopAnimating() when need to stop activity indicator
                myActivityIndicator.stopAnimating()
                
                // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
                myActivityIndicator.hidesWhenStopped = true
                
                
                //displaying data in tableview
                self.TableView.reloadData()
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myInt = indexPath.row
        print(myInt)
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SingleTowerVC") as! SingleTowerVC
        myVC.intPassed = myInt
        navigationController?.pushViewController(myVC, animated: true)
        
        
    }
    
    
    
    
   
    
    
    
    
    

}
