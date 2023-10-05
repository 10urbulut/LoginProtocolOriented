//
//  ViewController.swift
//  LoginProtocolOriented
//
//  Created by Onur Bulut on 5.10.2023.
//

import UIKit

class RootViewController: UIViewController, RootViewModelOutput {
    
    private let viewModel : RootViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        viewModel.checkLogin()
    }

    
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        viewModel.output = self
        
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func showMainApp(){
        let mainController = MainViewController()
        navigationController?.present(mainController, animated:  true)
    }
    
    func showLogin(){
        let loginController = LoginViewController()
        navigationController?.present(loginController, animated:  true)
    }
}

