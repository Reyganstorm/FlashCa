//
//  SettingsController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

class SettingsController: UIViewController , Routable {
    
    var router: MainRouter?
    
    let baseView: SettingsView = SettingsView()
    
    private let settingsOption = [
        "Account",
        "touch/face ID",
        "Language",
        "About App"
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        baseView.addTableViewDelegate(dataSource: self, delegate: self)
        
        navigationItem.title = "Settings"
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


extension SettingsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTVCell.identifier, for: indexPath) as! SettingsTVCell
        let optionName = settingsOption[indexPath.row]
        cell.configure(option: optionName)
        return cell
    }
    
    
}

extension SettingsController: UITableViewDelegate {
    
}
