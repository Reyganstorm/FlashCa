//
//  SettingsController.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import UIKit

class SettingsController: UIViewController , Routable {
    
    var router: MainRouter?
    
    private let baseView: SettingsView = SettingsView()
    
    private let settingsOption = [
        "Account",
        "touch/face ID",
        "Language",
        "ThemeColor",
        "About App",
        "Guide line",
        "AppVersion"
    ]
    
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        dissmisWithSwipe()
        view.backgroundColor = Resources.Colors.mainDark
        baseView.addTableViewDelegate(dataSource: self, delegate: self)
    }
    
    func dissmisWithSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(back))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc func back() {
        router?.back()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Settings"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Resources.Colors.activ
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
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


// MARK: - UITable DataSourse
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

// MARK: - UITable Delegate
extension SettingsController: UITableViewDelegate {
    
}
