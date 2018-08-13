//
//  BaseAppRouter.swift
//  LoginViper
//
//  Created by Huy Nguyen on 8/14/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class BaseAppRouter: IAppRouter {
	private let assembler: Assembler!
	private let navigationController: UINavigationController?
	
	init(navigationController: UINavigationController?, assembler: Assembler) {
		self.navigationController = navigationController
		self.assembler = assembler
	}
	
	public var resolver: Resolver {
		return assembler.resolver
	}
	
	public func dismissFromNavigationController(_ animated: Bool) {
		dismissFromNavigationController(animated, nil)
	}
	
	public func dismissFromNavigationController(_ animated: Bool, _ completion: (() -> Void)?) {
		_ = navigationController?.popViewController(animated: animated)
		completion?()
	}
	
	public func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool) where T: UIViewController {
		presentModule(view, type, animated, nil)
	}
	
	public func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ completion: (() -> Void)?) where T: UIViewController {
		guard let vc = resolver.resolve(view, argument: self as IAppRouter) else { return }
		switch type {
		case .root:
			navigationController?.setViewControllers([vc], animated: animated)
		case .push:
			navigationController?.pushViewController(vc, animated: animated)
			completion?()
		case .present:
			navigationController?.present(vc, animated: animated) {
				completion?()
			}
		case .modal:
			vc.modalTransitionStyle = .crossDissolve
			vc.modalPresentationStyle = .overCurrentContext
			navigationController?.present(vc, animated: animated) {
				completion?()
			}
		case .popAndPush:
			_ = navigationController?.popViewController(animated: false)
			_ = navigationController?.pushViewController(vc, animated: animated)
			completion?()
		}
	}
	
	public func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any]) where T: UIViewController {
		presentModule(view, type, animated, parameters, nil)
	}
	
	public func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any], _ completion: (() -> Void)?) where T: UIViewController {
		guard let vc = resolver.resolve(view, arguments: self as IAppRouter, parameters) else { return }
		switch type {
		case .root:
			navigationController?.setViewControllers([vc], animated: animated)
		case .push:
			navigationController?.pushViewController(vc, animated: animated)
			completion?()
		case .present:
			navigationController?.present(vc, animated: animated) {
				completion?()
			}
		case .modal:
			vc.modalTransitionStyle = .crossDissolve
			vc.modalPresentationStyle = .overCurrentContext
			navigationController?.present(vc, animated: animated) {
				completion?()
			}
		case .popAndPush:
			_ = navigationController?.popViewController(animated: false)
			_ = navigationController?.pushViewController(vc, animated: animated)
			completion?()
		}
	}
}
