//
//  ViewController.swift
//  TSBus
//
//  Created by Никита Аплин on 05/12/2018.
//  Copyright © 2018 Никита Аплин. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UIWebViewDelegate {
    let webView = WKWebView()
    
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        print("loaded")
        let js = "document.getElementsByTagName('body')[0].innerHTML"
        var doc = webView.evaluateJavaScript(js, completionHandler: nil)
        print(doc)
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        let url = URL(string: "http://localhost/obj/")
        webView.load(URLRequest(url: url!))
        // Do any additional setup after loading the view, typically from a nib.
    }
//    func webViewDidFinishLoad(webView : UIWebView) {
//        //Page is loaded do what you want
//        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
//            let doc = webView.stringByEvaluatingJavaScript(from: "document.documentElement.outerHTML")
//            print(doc)
//        }
//        print("LOADED BLYAT")
//    }
//
//    func webView(webView: WKWebView!, didFinishNavigation navigation: WKNavigation!) {
//        print("Finished navigating to url \(webView.url)");
//    }

}

extension WKWebView {
    func evaluate(script: String, completion: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) {
        var finished = false
        
        evaluateJavaScript(script) { (result, error) in
            if error == nil {
                if result != nil {
                    completion(result as AnyObject, nil)
                }
            } else {
                completion(nil, error! as? NSError)
            }
            finished = true
        }
        
        while !finished {
            RunLoop.current.run(mode: .defaultRunLoopMode, before: Date.distantFuture)
        }
    }
}
