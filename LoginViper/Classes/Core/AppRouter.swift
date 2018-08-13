//
//  AppRouter.swift
//  LoginViper
//
//  Created by Huy Nguyen on 8/14/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public enum PresentType {
	case root, push, popAndPush, present, modal
}

public protocol IAppRouter {
	var resolver: Resolver { get }
	
	/*
	 Present ViewController with Completion Handler
	 */
	
	func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool)
	func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ completion: (() -> Void)?)
	
	/*
	 Present ViewController with Parameters and Completion Handler
	 */
	
	func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any])
	func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any], _ completion: (() -> Void)?)
	
	/*
	 Dismiss ViewController with Completion Handler and without Completion Handler
	 */
	
	func dismissFromNavigationController(_ animated: Bool)
	func dismissFromNavigationController(_ animated: Bool, _ completion: (() -> Void)?)
}

public class AppRouter: BaseAppRouter {
	static let shared = AppRouter.createAppRouter()
	
	private static func createAppRouter() -> AppRouter {
		/*
		 | To use this method, you must be Embed the Main.storyboard with UINavigationController
		 | If you don't, your application will be crash.
		 */
		
		let rootVC = UIApplication.shared.delegate!.window!!.rootViewController! as? UINavigationController
		
		/*
		 | Let's register all your Assembly Class here
		 */
		
		let assembler = Assembler()
		assembler.apply(assemblies: [
			CommonAssembly(),
            LoginAssembly()
		])
		
		let router = AppRouter(navigationController: rootVC, assembler: assembler)
		return router
	}
}
