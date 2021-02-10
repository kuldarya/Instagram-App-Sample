//
//  ProfileViewController.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 5.02.21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
    @IBAction private func didTapMenuButton(_ sender: UIBarButtonItem) {
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}
