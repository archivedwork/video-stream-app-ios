//
//  NewsVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/11/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import Alamofire



class NewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //a list to store news
    var news = [Notify]()
    
    //variables
    var myInt = Int()
    
    @IBOutlet weak var TableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      ///  self.TableView.delegate = self
       // self.TableView.dataSource = self

        // register cell
        self.TableView.register(UINib(nibName: "NewsTableCell", bundle: nil), forCellReuseIdentifier: "NewsTableCell")
        
        // call news function
        self.getNewsData()
    }
    


    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell", for: indexPath) as! NewsTableCell
        
        //getting the tower for the specified position
        let notify: Notify
        notify = news[indexPath.row]
        
        
        cell.TitleLbl.text = notify.Title
        cell.DatetimeLbl.text = notify.DateTime
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myInt = indexPath.row
        print(myInt)
        
      //  let myVC = storyboard?.instantiateViewController(withIdentifier: "SingleNewsVC") as! SingleNewsVC
       // myVC.intPassed = myInt
      //  navigationController?.pushViewController(myVC, animated: true)
        
        
        // Safe Present
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SingleNewsVC") as? SingleNewsVC
        {
            vc.intPassed = myInt
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
    @IBAction func BackActionBtn(_ sender: Any) {
        //  previous view controller
        navigationController?.popViewController(animated: true)
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
                // print(towersArray)
                //traversing through all elements of the array
                for i in 0..<NewsArray.count{
                    
                    //adding hero values to the hero list
                    self.news.append(Notify(
                        Title: (NewsArray[i] as AnyObject).value(forKey: "Title") as? String,
                        Content: (NewsArray[i] as AnyObject).value(forKey: "Content") as? String,
                        
                        DateTime: (NewsArray[i] as AnyObject).value(forKey: "DateTime") as? String
                    ))
                    
                }
                
                
                //displaying data in tableview
                self.TableView.reloadData()
                
                // Call stopAnimating() when need to stop activity indicator
                myActivityIndicator.stopAnimating()
                
                // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
                myActivityIndicator.hidesWhenStopped = true
                
                
            }
        }
        
    }
    
    
    
}
