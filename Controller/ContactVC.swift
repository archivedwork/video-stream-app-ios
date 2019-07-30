//
//  ContactVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/12/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func BackActionBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
