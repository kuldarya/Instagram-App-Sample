//
//  SettingsViewController.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 5.02.21.
//

import UIKit

/// View Controller to show user settings
final class SettingsViewController: UIViewController {
    // MARK: - Properties

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingsViewController.className)
        return tableView
    }()
    
    private var data = [SettingCellModel]()

    // MARK: - VC Lifesycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        configureModels()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    // MARK: - Private methods
    private func configureModels() {
        let section = [SettingCellModel(title: "Log Out") { [weak self] in
            self?.didTapLogOut()
        }]
        data.append(contentsOf: section)
    }
    
    private func didTapLogOut() {
        AuthManager.shared.logOut(completion: { success in
            DispatchQueue.main.async {
                if success {
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true) {
                        self.navigationController?.popToRootViewController(animated: false)
                        self.tabBarController?.selectedIndex = 0
                    }
                } else {
                    // error occured
                }
            }
        })
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsViewController.className, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].handler()
    }
    
}

