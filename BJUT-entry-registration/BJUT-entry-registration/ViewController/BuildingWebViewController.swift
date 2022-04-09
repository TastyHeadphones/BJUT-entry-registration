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
    var request: URLRequest!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        webView.load(request)
        // Do any additional setup after loading the view.
    }
}
