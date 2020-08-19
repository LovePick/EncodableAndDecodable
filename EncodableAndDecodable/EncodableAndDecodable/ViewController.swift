//
//  ViewController.swift
//  EncodableAndDecodable
//
//  Created by T2P mac mini on 19/8/2563 BE.
//  Copyright © 2563 pucknavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tapOnPOST(_ sender: Any) {
        Webservice().postAPI(){ post in
            print(post)
        }
    }
    
    @IBAction func tapOnGET(_ sender: Any) {
        Webservice().getPost(){ posts in
            print(posts)
        }
    }
    
}

