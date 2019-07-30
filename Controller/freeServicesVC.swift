//
//  freeServicesVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 6/1/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class freeServicesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackActionBtn(_ sender: Any) {
        
        //  previous view controller
        navigationController?.popViewController(animated: true)
        // root view controller
        // navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
   // let name = arrayOfID[indexPath.row]
  //  let VC = storyboard?.instantiateViewController(withIdentifier: name)
  //  self.navigationController?.pushViewController(VC!, animated: true)
    
    @IBAction func showInfoPage(_ sender: Any) {
          let identifierName = "infoPage"
          let VC = storyboard?.instantiateViewController(withIdentifier: identifierName)
          self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    
    @IBAction func showTVPage(_ sender: Any) {
        let identifierName = "TV"
        let VC = storyboard?.instantiateViewController(withIdentifier: identifierName)
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
    
    
    @IBAction func showMoviesPage(_ sender: Any) {
        let identifierName = "infoPage"
        let VC = storyboard?.instantiateViewController(withIdentifier: identifierName)
        self.navigationController?.pushViewController(VC!, animated: true)
    }

}
