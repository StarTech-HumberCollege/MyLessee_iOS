//
//  HomeViewController.swift
//  MyLesse_iOS
//
//  Created by Zhangzhi Wang on 2023-03-30.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var post1 = (name: "Tuyi Chen", profile:"tuyi", text: "Hi everyone! I’m Tuyi and just recently moved to Toronto.I’m in search of a 2 bed apartment to share with my sister in the midtown area, we are looking to pay around $2,500 plus utilities. ")
    
    var post2 = (name: "Anton Vinokurov", profile:"anton", text: "3 Bedroom apartment in the heart of Toronto downtown.")
    
    var post3 = (name: "Bill Robertson", profile:"sponsor", text: "For all your real estate needs, Bill Robertson Real Estate agency is the best choice. We have 4 offices in the greater Toronto")
    
    var posts = [(name: String, profile: String, text: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeTextCell", bundle: nil), forCellReuseIdentifier: "HomeTextCell")
        tableView.register(UINib(nibName: "HomeImageCell", bundle: nil), forCellReuseIdentifier: "HomeImageCell")
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeImageCell", for: indexPath) as! HomeImageCell
        
        cell.nameLabel.text = posts[indexPath.row].name
        cell.bodyTextLabel.text = posts[indexPath.row].text
        cell.profileImageView.image = UIImage(named: posts[indexPath.row].profile)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "ToCollectionView", sender: nil)
        }
    }
    
}
