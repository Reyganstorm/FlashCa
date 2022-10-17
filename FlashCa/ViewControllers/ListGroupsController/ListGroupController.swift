//
//  ViewController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.10.2022.
//

import UIKit

class ListGroupController: UIViewController, Routable {
    var router: MainRouter?
    
    let baseView: ListGroupView = ListGroupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseView.addTableViewDelegate(dataSource: self, delegate: self)
        
        view.backgroundColor = .link
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    

}

extension ListGroupController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        cell.configure()
        return cell
    }
}
