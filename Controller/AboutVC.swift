//
//  AboutVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/6/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

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
    

}
