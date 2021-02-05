//
//  LoginViewController.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 5.02.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
       return UIButton()
    }()
    
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
       return UIView()
    }()

    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //setup frames
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(privacyButton)
        view.addSubview(termsButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        
    }
    
    @objc private func didTapCreateAccountButton() {
        
    }
    
    @objc private func didTapTermsButton() {
        
    }
    
    @objc private func didTapPrivacyButton() {
        
    }
}
