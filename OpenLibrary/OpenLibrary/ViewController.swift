//
//  ViewController.swift
//  OpenLibrary
//
//  Created by AWM Solutions on 9/11/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController,   UITextViewDelegate {
    @IBOutlet weak var ISBNLibro: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    @IBAction func buscarLibro(_ sender: Any) {
        let isbn : String?
        isbn = ISBNLibro.text
        ISBNLibro.text = String()
        print(isbn!)
    
        //Conexion 
        let urls1 = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let urls = urls1 + isbn!
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as      URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        print(urls)
        
       //Imprimir en TextView
        myTextView.text = "\(String(describing: texto))"
       /*do {
            let json = try JSONSerialization.jsonObject(with: datos! as Data, options : JSONSerialization.ReadingOptions.mutableLeaves)
         
            let dico1 = json as! NSDictionary
            let dico2 = dico1 ["ISBN"] as! NSDictionary
            let dico3 = dico2 ["publishers"] as! NSDictionary
            let dico4 = dico3 ["identifiers"] as! NSDictionary
            let dico5 = dico4 ["url"] as! NSDictionary
            let dico6 = dico5 ["subject_places"] as! NSDictionary
            let dico7 = dico6 ["subjects"] as! NSDictionary
            let dico8 = dico7 ["subject_people"] as! NSDictionary
            let dico9 = dico8 ["authors"] as! NSDictionary
           self.myTextView.text = dico9 ["by_statement"] as! NSString as String
   
        } catch _{
            
        }*/
        
    }
    @IBAction func clear(_ sender: Any) {
        myTextView.text = ""
    }
}

