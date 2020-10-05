//
//  ViewController.swift
//  completeProject
//
//  Created by Aakarsh Yadav on 04/10/20.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var searchInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let searhcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        searhcBtn.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        searhcBtn.setTitle("Search", for: .normal)
        searhcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        searhcBtn.addTarget(self, action: #selector(MainVC.searchUser), for: .touchUpInside)
        searchInput.inputAccessoryView = searhcBtn
    }
    
    @objc func searchUser(){
        print("Bingo searched here")
//        print(searchInput.text)
//        let data = NetworkService.searchCall("ss")
       
        
  performSegue(withIdentifier: "UsersVC", sender: self)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let userVC = segue.destination as? UsersVC {
            if let searchString: String  = searchInput.text {
                userVC.initSearch(searchString: searchString )
            }
        }
    }
}

