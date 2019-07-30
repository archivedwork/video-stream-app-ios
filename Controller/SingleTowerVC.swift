//
//  SingleTowerVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/8/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import Alamofire
import MapKit


class custompin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class SingleTowerVC: UIViewController {

    var intPassed = Int()
    
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var Mapkit: MKMapView!
    var dbLat : Double?
    var dblong : Double?
    
    var longitude = ""
    var Latitude = ""
    
    var ttitle = ""
    var mobile = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Int Passed\(intPassed)")
        self.getSingleOwnerNameData()
        //self.checkReachability()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.checkReachability()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
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
    }
    
    
    func getSingleOwnerNameData(){
        
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
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
             
                        self.ownerName.text =  (towersArray[self.intPassed] as AnyObject).value(forKey: "Title") as? String
                        self.mobileLbl.text =  (towersArray[self.intPassed] as AnyObject).value(forKey: "phone") as? String
                        
                       
                 
                // Call stopAnimating() when need to stop activity indicator
                myActivityIndicator.stopAnimating()
                
                // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
                myActivityIndicator.hidesWhenStopped = true
                
                
             
                
            }
        }
    }
    
    // Check Network Connection
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
            //mapView.layer.cornerRadius = 12
            
            
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
                    
                    self.longitude =  (towersArray[self.intPassed] as AnyObject).value(forKey: "longitude") as! String
                    self.Latitude =  (towersArray[self.intPassed] as AnyObject).value(forKey: "Latitude") as! String
                    self.ttitle = (towersArray[self.intPassed] as AnyObject).value(forKey: "Title") as! String
                    self.mobile = (towersArray[self.intPassed] as AnyObject).value(forKey: "phone") as! String
                    
                    //self.dblong = (self.longitude as NSString).doubleValue
                   // print(self.dblong)
                    
                    // self.dbLat = (self.Latitude as NSString).doubleValue
                   // print(self.dbLat)
                    self.dblong = 44.3240669
                    self.dbLat = 33.3151023
                    
                    
                    
                    let location = CLLocationCoordinate2D(latitude: self.dbLat! , longitude: self.dblong!)
                    let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006))
                    self.Mapkit.setRegion(region, animated: true)
                    
                    let pin = custompin(pinTitle: self.ttitle, pinSubTitle: self.mobile, location: location)
                    self.Mapkit.addAnnotation(pin)
                    
                }
            }
            
            // Call stopAnimating() when need to stop activity indicator
            myActivityIndicator.stopAnimating()
            
            // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
            myActivityIndicator.hidesWhenStopped = true
            
            
         
        }else if currentReachabilityStatus == .reachableViaWWAN{
            
            print("User is connected to the internet via WWAN.")
            
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
                    
                    self.longitude =  (towersArray[self.intPassed] as AnyObject).value(forKey: "longitude") as! String
                    self.Latitude =  (towersArray[self.intPassed] as AnyObject).value(forKey: "Latitude") as! String
                    self.ttitle = (towersArray[self.intPassed] as AnyObject).value(forKey: "Title") as! String
                    self.mobile = (towersArray[self.intPassed] as AnyObject).value(forKey: "phone") as! String
                    
                    //self.dblong = (self.longitude as NSString).doubleValue
                    // print(self.dblong)
                    
                    // self.dbLat = (self.Latitude as NSString).doubleValue
                    // print(self.dbLat)
                    self.dblong = 44.3240669
                    self.dbLat = 33.3151023
                    
                    
                    
                    let location = CLLocationCoordinate2D(latitude: self.dbLat! , longitude: self.dblong!)
                    let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006))
                    self.Mapkit.setRegion(region, animated: true)
                    
                    let pin = custompin(pinTitle: self.ttitle, pinSubTitle: self.mobile, location: location)
                    self.Mapkit.addAnnotation(pin)
                    
                }
            }
            
            // Call stopAnimating() when need to stop activity indicator
            myActivityIndicator.stopAnimating()
            
            // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
            myActivityIndicator.hidesWhenStopped = true
            
        } else {
            print("There is no internet connection")
            
            // Alert User for No Connection
            let alert = UIAlertController(title: "تعذر الاتصال", message: "يرجى التحقق من اتصالك بالانترنت", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                (alert: UIAlertAction!) in
                print("Ok handler pressed")
                self.getSingleTowerData()
                
            }))
            //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
        }
    }
    
    
    
    
    func getSingleTowerData(){
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
                
                self.longitude =  (towersArray[self.intPassed] as AnyObject).value(forKey: "longitude") as! String
                self.Latitude =  (towersArray[self.intPassed] as AnyObject).value(forKey: "Latitude") as! String
                self.ttitle = (towersArray[self.intPassed] as AnyObject).value(forKey: "Title") as! String
                self.mobile = (towersArray[self.intPassed] as AnyObject).value(forKey: "phone") as! String
                
                //self.dblong = (self.longitude as NSString).doubleValue
                // print(self.dblong)
                
                // self.dbLat = (self.Latitude as NSString).doubleValue
                // print(self.dbLat)
                self.dblong = 44.3240669
                self.dbLat = 33.3151023
                
                
                
                let location = CLLocationCoordinate2D(latitude: self.dbLat! , longitude: self.dblong!)
                let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006))
                self.Mapkit.setRegion(region, animated: true)
                
                let pin = custompin(pinTitle: self.ttitle, pinSubTitle: self.mobile, location: location)
                self.Mapkit.addAnnotation(pin)
                
            }
        }
        
        // Call stopAnimating() when need to stop activity indicator
        myActivityIndicator.stopAnimating()
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = true
    }
    

}
