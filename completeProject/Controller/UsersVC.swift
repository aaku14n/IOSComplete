//
//  UsersVC.swift
//  completeProject
//
//  Created by Aakarsh Yadav on 04/10/20.
//

import UIKit

class UsersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private weak var userTable: UITableView!
    private(set) public var users = [User]()
    public var searchString: String = ""
    public var items:[User] = []
    func initSearch(searchString:String) {
        self.searchString = searchString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.dataSource = self
        userTable.delegate = self
        // Do any additional setup after loading the view.
        self.getInitialData{ [weak self] (films) in
            guard let weakSelf = self else{
                return
            }
            weakSelf.users = films
            print(self?.users)
            print("Data")
            
            DispatchQueue.main.async {
                print("in Async")
                print(weakSelf.userTable)
                weakSelf.userTable.reloadData()
                print("Data updated")
            }
          }
    }
    func getInitialData(completionHandler: @escaping ([User]) -> Void){
        let url = URL(string: "https://api.github.com/search/users?q=\(self.searchString)")!
        print("Making api call here")
         let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
           if let error = error {
             print("Error with fetching films: \(error)")
             return
           }
           
           guard let httpResponse = response as? HTTPURLResponse,
                 (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(String(describing: response))")
             return
           }
          
           if let data = data,
             let filmSummary = try? JSONDecoder().decode(Users.self, from: data) {
            completionHandler(filmSummary.items )
           }
           
         })
         task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("IN counte",self.users.count)
        return self.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableCell {
            let user = self.users[indexPath.row]
            print(user)
            cell.updateViews(user: user)
            return cell
        }else{
            return UserTableCell()
        }
    }
  

}
