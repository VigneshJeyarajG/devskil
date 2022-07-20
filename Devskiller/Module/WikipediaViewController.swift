//
//  WikipediaViewController.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 19/07/22.
//  Copyright © 2022 Mindera. All rights reserved.
//

import UIKit
import WebKit

class WikipediaViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showWikipedia()
    }
    
    func showWikipedia() {
        webView.load(URLRequest(url: URL(string: SateLiteArray.wikipediaLink)!))
    }

    @IBAction func backTapped(_ sender: UIButton) {
       navigationController?.popViewController(animated: true)
    }
}

extension WikipediaViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        LoadingUtils.shared.showActivityIndicator(self.view)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        LoadingUtils.shared.hideActivityIndicator(self.view)
    }
}
