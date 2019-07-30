//
//  SingleNewsVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/12/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import Alamofire


class SingleNewsVC: UIViewController {

    var intPassed = Int()
    
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var ContentLbl: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNewsData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //self.getNewsData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func CloseActionBtn(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    func getNewsData(){
        
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
        Alamofire.request(NOTIFICATION_URL).responseJSON { response in
            
            //getting json
            if let json = response.result.value {
                print(json)
                
                let NewsArray : NSArray  = json as! NSArray
                
                
                self.TitleLbl.text = (NewsArray[self.intPassed] as AnyObject).value(forKey: "Title") as? String
                self.DateLbl.text = (NewsArray[self.intPassed] as AnyObject).value(forKey: "DateTime") as? String
                self.ContentLbl.text = (NewsArray[self.intPassed] as AnyObject).value(forKey: "Content") as? String
                
                
                
                
                
                
            
        }
        
    }
        
        // Call stopAnimating() when need to stop activity indicator
        myActivityIndicator.stopAnimating()
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = true
    }
    
    
    
    
    
}
