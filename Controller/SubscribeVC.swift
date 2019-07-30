//
//  SubscribeVC.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 6/1/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit
import WebKit

class SubscribeVC: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://reseller.baghdad-link.com")
        let request = URLRequest(url: url!)
        
        WebView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backActionBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    /*
     let url = URL(string: "https://www.google.com")
     let request = URLRequest(url: url!)
     
     webview.load(request)
 */

}
