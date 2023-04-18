//
//  HomeViewController.swift
//  MyLesse_iOS
//
//  Created by Zhangzhi Wang on 2023-03-30.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello world")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let storeURL = appDelegate.persistentContainer.persistentStoreCoordinator.url(for: appDelegate.persistentContainer.persistentStoreCoordinator.persistentStores.first!)

            print("Core Data store URL: \(storeURL)")
        
        let request: NSFetchRequest<Post> = Post.fetchRequest()
        
        do {
            posts = try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
        
        if posts.isEmpty {
            
            let post1 = Post(context: context)
            post1.name = "Tuyi Chen"
            post1.profile = UIImage(named: "tuyi")?.pngData()
            post1.text = "Hi everyone! I’m Tuyi and just recently moved to Toronto.I’m in search of a 2 bed apartment to share with my sister in the midtown area, we are looking to pay around $2,500 plus utilities."
            
            let post2 = Post(context: context)
            post2.name = "Anton Vinokurov"
            post2.profile = UIImage(named: "anton")?.pngData()
            post2.text = "3 Bedroom apartment in the heart of Toronto downtown."
            
            let post3 = Post(context: context)
            post3.name = "Bill Robertson"
            post3.profile = UIImage(named: "sponsor")?.pngData()
            post3.text = "For all your real estate needs, Bill Robertson Real Estate agency is the best choice. We have 4 offices in the greater Toronto."
            
            appDelegate.saveContext()
            
            do {
                posts = try context.fetch(request)
            } catch {
                print("Error fetching data from context: \(error)")
            }
        }
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeTextCell", bundle: nil), forCellReuseIdentifier: "HomeTextCell")
        tableView.register(UINib(nibName: "HomeImageCell", bundle: nil), forCellReuseIdentifier: "HomeImageCell")
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeImageCell", for: indexPath) as! HomeImageCell
            
            cell.nameLabel.text = posts[indexPath.row].name
            cell.bodyTextLabel.text = posts[indexPath.row].text
            //            cell.profileImageView.image = UIImage(named: posts[indexPath.row].profile ?? "alvaro")
            if let imageData = posts[indexPath.row].profile {
                cell.profileImageView.image = UIImage(data: imageData)
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTextCell", for: indexPath) as! HomeTextCell
            
            cell.nameLabel.text = posts[indexPath.row].name
            cell.bodyTextLabel.text = posts[indexPath.row].text
//            cell.profileImageView.image = UIImage(named: posts[indexPath.row].profile ?? "alvaro")
            if let imageData = posts[indexPath.row].profile {
                cell.profileImageView.image = UIImage(data: imageData)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "ToCollectionView", sender: nil)
        }
    }
    
}
