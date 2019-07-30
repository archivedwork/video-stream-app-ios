//
//  CheckIPVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/7/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import Alamofire


class CheckIPVC: UIViewController {

    
    let my_publicIP = "https://bot.whatismyipaddress.com"
    let server_public_ip = "37.237.161.21"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the Activity Indicator
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        // Add it to the view where you want it to appear
        view.addSubview(activityIndicator)
        
        // Set up its size (the super view bounds usually)
        activityIndicator.frame = view.bounds
        // Start the loading animation
        activityIndicator.startAnimating()
       
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.checkReachability()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    
    
    // Check Network Connection
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
            //fetch public ip string
            Alamofire.request(my_publicIP).responseString { response in
                print("Success: \(response.result.isSuccess)")
                let my_ip = response.result.value!
                
                print("My Public IP: \(my_ip)")
                
               
                
                if  my_ip == self.server_public_ip{
                    print("server IP : Display Main Page with movies and tvs")
                    
                    self.performSegue(withIdentifier: "OriginalPage", sender: nil)
                    
                    //let VC = self.storyboard?.instantiateViewController(withIdentifier: "OriginalIPViewController") as? OriginalIPViewController
                    //self.navigationController?.pushViewController(VC!, animated: true)
                    
                    
                    
                    //guard let myVC = self.storyboard?.instantiateViewController(withIdentifier: "OriginalIPViewController") else { return }
                    //let navController = UINavigationController(rootViewController: myVC)
                    
                    // self.navigationController?.present(navController, animated: true, completion: nil)
                    
                }else{
                    print("Mobile IP: Display Main page without movies and tvs")
                    
                    self.performSegue(withIdentifier: "DeviceIPVC", sender: nil)
                    //let VC = self.storyboard?.instantiateViewController(withIdentifier: "ServerIPViewController") as? ServerIPViewController
                    //self.navigationController?.pushViewController(VC!, animated: true)
                }
              
                
            }
            
            
            
        }else if currentReachabilityStatus == .reachableViaWWAN{
            
            print("User is connected to the internet via WWAN.")
            
            Alamofire.request(my_publicIP).responseString { response in
                print("Success: \(response.result.isSuccess)")
                let my_ip = response.result.value!
                
                print("My Public IP: \(my_ip)")
                
                
                if my_ip == self.server_public_ip{
                    print("server IP : Display Main Page with movies and tvs")
                    
                    self.performSegue(withIdentifier: "OriginalPage", sender: nil)
                    
                    //let VC = self.storyboard?.instantiateViewController(withIdentifier: "OriginalIPViewController") as? OriginalIPViewController
                    //self.navigationController?.pushViewController(VC!, animated: true)
                    
                    
                    
                    //guard let myVC = self.storyboard?.instantiateViewController(withIdentifier: "OriginalIPViewController") else { return }
                    //let navController = UINavigationController(rootViewController: myVC)
                    
                    // self.navigationController?.present(navController, animated: true, completion: nil)
                    
                }else{
                    print("Mobile IP: Display Main page without movies and tvs")
                    
                    self.performSegue(withIdentifier: "DeviceIPVC", sender: nil)
                    //let VC = self.storyboard?.instantiateViewController(withIdentifier: "ServerIPViewController") as? ServerIPViewController
                    //self.navigationController?.pushViewController(VC!, animated: true)
                }
            }
            
            
        } else {
            print("There is no internet connection")
            
            // Alert User for No Connection
            let alert = UIAlertController(title: "تعذر الاتصال", message: "يرجى التحقق من اتصالك بالانترنت", preferredStyle: .alert)
            
           //alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                print("Yay! Try Again!!")
                self.checkReachability()
            }))
            
            self.present(alert, animated: true)
            
        }
    }

  

}
