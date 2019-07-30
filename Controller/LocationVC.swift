//
//  LocationVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/6/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}




class LocationVC: UIViewController {
    
    @IBOutlet weak var LocationMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    override func viewDidAppear(_ animated: Bool) {
        self.checkReachability()
    }
    
    
    // Check Network Connection
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
            //mapView.layer.cornerRadius = 12
            
            
            let location = CLLocationCoordinate2D(latitude: 33.3151023, longitude:44.3240669)
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
            self.LocationMapView.setRegion(region, animated: true)
            
            let pin = customPin(pinTitle: "رابط بغداد", pinSubTitle: "Phone: 078xxxxx,Web: http://baghdad-link.com", location: location)
            self.LocationMapView.addAnnotation(pin)
            //self.LocationMapView.delegate = self
            
        }else if currentReachabilityStatus == .reachableViaWWAN{
            
            print("User is connected to the internet via WWAN.")
            
            // load location on map
            //mapView.layer.cornerRadius = 12
            
            let location = CLLocationCoordinate2D(latitude: 33.3151023, longitude:44.3240669)
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
            self.LocationMapView.setRegion(region, animated: true)
            
            let pin = customPin(pinTitle: "رابط بغداد", pinSubTitle: "Phone: 078xxxxx,Web: http://baghdad-link.com", location: location)
            self.LocationMapView.addAnnotation(pin)
            //self.LocationMapView.delegate = self
            
        } else {
            print("There is no internet connection")
            
            // Alert User for No Connection
            let alert = UIAlertController(title: "تعذر الاتصال", message: "يرجى التحقق من اتصالك بالانترنت", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
        }
    }
    
    
    
    
    
    
    
    
  

}
