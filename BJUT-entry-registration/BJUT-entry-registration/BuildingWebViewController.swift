//
//  BuildingWebViewController.swift
//  BJUT-entry-registration
//
//  Created by Magic Keegan on 4/8/22.
//

import UIKit
import WebKit
class BuildingWebViewController: UIViewController,WKUIDelegate {
    @IBOutlet var webView: WKWebView!
    var building:Building!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = building.generateBuildingRequest()
        webView.uiDelegate = self
        webView.load(request)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
