//
//  ViewController.swift
//  Fortuna
//
//  Created by Xu Yannis on 14/10/18.
//  Copyright (c) 2014年 Yannis Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func rootViewTapped(sender: AnyObject) {
        displayRandomQuote()
    }
    
    @IBOutlet weak var quotationTextView: UITextView!
    var delegate = UIApplication.sharedApplication().delegate as AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        println("Hacking in Swift, since iOS 8....")
//        println("controller: \(self)")
//        println("view: \(self.view)")
//        println("view's frame: \(self.view.frame)")
        // Do any additional setup after loading the view, typically from a nib.
//        let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
//        println("positive quotes path: \(path)")
//        
        quotationTextView.editable = false
        quotationTextView.selectable = false
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        displayRandomQuote()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        println("awakeFromNib quotationTextView: \(quotationTextView)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayRandomQuote(){
        
        let whichType = Int(arc4random_uniform(2))
        var quotesType = delegate.negativeQuotes
        
        if whichType == 0 {
            println("use positiveQuotes")
            quotesType = delegate.positiveQuotes
        } else{
            println("use negativeQuotes")
//            quotesType = delegate.negativeQuotes
        }
        
        var quoteLength = quotesType.count
        var whichQuote = arc4random_uniform(UInt32(quoteLength))
        var quote = quotesType[Int(whichQuote)]
        
        quotationTextView.text = quote
        
    }

}

