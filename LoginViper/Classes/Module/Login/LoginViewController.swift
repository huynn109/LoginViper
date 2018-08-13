//
//  LoginViewController.swift
//  LoginViper
//
//  Created by Huy Nguyen on 8/14/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILoginViewController: class {	
}

public class LoginViewController: UIViewController {
	var presenter: ILoginPresenter?

	override public func viewDidLoad() {
        super.viewDidLoad()
        // Do someting here...
    }
}

extension LoginViewController: ILoginViewController {
}

extension LoginViewController {
}

extension LoginViewController {
}
