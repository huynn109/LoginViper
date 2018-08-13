//
//  LoginAssembly.swift
//  LoginViper
//
//  Created by Huy Nguyen on 8/14/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class LoginAssembly: Assembly {
	
	public func assemble(container: Container) {
		container.register(ILoginWireframe.self) { (_, appRouter: IAppRouter) -> ILoginWireframe in
			LoginWireframe(router: appRouter)
		}
		
		container.register(ILoginInteractor.self) { _ in
			
			/*
			 | Register your manager here, ex:
			 |
			 | let sampleManager = r.resolve(ISampleManager.self)!
			 |
			 | And let's initial the manager with interactor, ex:
			 |
			 | let interactor = LoginInteractor(sampleManager: sampleManager)
			 */
			
			let interactor = LoginInteractor()
			return interactor
		}
		
		container.register(ILoginPresenter.self) { (r, appRouter: IAppRouter, view: ILoginViewController) in
			let wireframe = r.resolve(ILoginWireframe.self, argument: appRouter)!
			let interactor = r.resolve(ILoginInteractor.self)!
			let presenter = LoginPresenter(interactor: interactor, wireframe: wireframe, view: view)
			interactor.delegate = presenter
			return presenter
		}
		
		/*
		 | If you need passing some paramenter,
		 | you can add new params with name parameters or other, ex:
		 |
		 | container.register(LoginViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
		 |     let view = LoginViewController()
		 |     let presenter = r.resolve(IPresenter.self, arguments: appRouter, view as ILoginViewController)!
		 |     presenter.parameters = parameters
		 |     view.presenter = presenter
		 |     return view
		 | }
		 */
		
		container.register(LoginViewController.self) { (r, appRouter: IAppRouter) in
			let view = LoginViewController()
			let presenter = r.resolve(ILoginPresenter.self, arguments: appRouter, view as ILoginViewController)!
			presenter.parameters = nil
			view.presenter = presenter
			return view
		}
	}
}