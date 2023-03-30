//
//  HomeViewController.swift
//  MyLesse_iOS
//
//  Created by Zhangzhi Wang on 2023-03-30.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var post1 = (name: "Tuyi", text: "Hi everyone! I’m Tuyi and just recently moved to Toronto.I’m in search of a 2 bed apartment to share with my sister in the midtown area, we are looking to pay around $2,500 plus utilities. ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
