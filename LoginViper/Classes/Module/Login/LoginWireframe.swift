//
//  LoginWireframe.swift
//  LoginViper
//
//  Created by Huy Nguyen on 8/14/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILoginWireframe: class {
	
}

public class LoginWireframe: ILoginWireframe {
	
	let router: IAppRouter

	init(router: IAppRouter) {
		self.router = router
	}
}
