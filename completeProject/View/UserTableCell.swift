//
//  UserTableCell.swift
//  completeProject
//
//  Created by Aakarsh Yadav on 04/10/20.
//

import UIKit

class UserTableCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    func updateViews(user:User){
        self.userImage.load(url: URL(string: user.avatar_url)! )
        userName.text = user.login
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
