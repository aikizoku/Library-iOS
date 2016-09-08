//
//  UIViewController+Transition.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/05.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation
import UIKit

enum UIViewTransitionType {
    case None
    case Present
    case Push
    case CrossDissolve
}

extension UIViewController {
    
    // MARK: - PresentViewController
    
    func presentViewControllerForNavigation(viewController: UIViewController, transitionType: UIViewTransitionType, completion: (UIViewController) -> Void) {
        let navigationController = UINavigationController.init(rootViewController: viewController)
        self.presentViewController(navigationController, transitionType: transitionType, completion: completion)
    }
    
    func presentViewController(viewController: UIViewController, transitionType: UIViewTransitionType, completion: (UIViewController) -> Void) {
        var animated = false
        switch transitionType {
        case .Present:
            animated = true
            viewController.modalTransitionStyle = .CoverVertical
        case .Push:
            self.view.window?.layer.addAnimation(UIViewController.transition(transitionType, on: true), forKey: nil)
        case .CrossDissolve:
            animated = true
            viewController.modalTransitionStyle = .CrossDissolve
        default:
            break;
        }
        self.presentViewController(viewController, animated: animated) { [unowned self] in
            completion(self)
        }
    }
    
    func dismissViewController(transitionType transitionType: UIViewTransitionType, completion: (UIViewController) -> Void) {
        var animated = false
        switch transitionType {
        case .Present:
            animated = true
            self.modalTransitionStyle = .CoverVertical
        case .Push:
            self.view.window?.layer.addAnimation(UIViewController.transition(transitionType, on: false), forKey: nil)
        case .CrossDissolve:
            animated = true
            self.modalTransitionStyle = .CrossDissolve
        default:
            break;
        }
        self.dismissViewControllerAnimated(animated) {
            completion(self)
        }
    }
    
    // MARK: - PushViewController
    
    func pushViewController(viewController: UIViewController, transitionType: UIViewTransitionType) {
        if let navigationController = self.navigationController {
            var animated = false
            switch transitionType {
            case .Present, .CrossDissolve:
                navigationController.view.layer.addAnimation(UIViewController.transition(transitionType, on: true), forKey: nil)
            case .Push:
                animated = true
            default:
                break;
            }
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    func popViewController(transitionType: UIViewTransitionType) {
        if let navigationController = self.navigationController {
            var animated = false
            switch transitionType {
            case .Present, .CrossDissolve:
                navigationController.view.layer.addAnimation(UIViewController.transition(transitionType, on: false), forKey: nil)
            case .Push:
                animated = true
            default:
                break;
            }
            navigationController.popViewControllerAnimated(animated)
        }
    }
    
    func popToViewController(viewController: UIViewController, transitionType: UIViewTransitionType) {
        if let navigationController = self.navigationController {
            var animated = false
            switch transitionType {
            case .Present, .CrossDissolve:
                navigationController.view.layer.addAnimation(UIViewController.transition(transitionType, on: false), forKey: nil)
            case .Push:
                animated = true
            default:
                break;
            }
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
    
    func popToRootViewController(transitionType: UIViewTransitionType) {
        if let navigationController = self.navigationController {
            var animated = false
            switch transitionType {
            case .Present, .CrossDissolve:
                navigationController.view.layer.addAnimation(UIViewController.transition(transitionType, on: false), forKey: nil)
            case .Push:
                animated = true
            default:
                break;
            }
            navigationController.popToRootViewControllerAnimated(animated)
        }
    }
    
    // MARK: - Private
    
    static private func transition(transitionType: UIViewTransitionType, on: Bool) -> CATransition {
        let transition = CATransition.init();
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        switch transitionType {
        case .Present:
            transition.type = kCATransitionMoveIn
            transition.subtype = on ? kCATransitionFromBottom : kCATransitionFromTop
        case .Push:
            transition.type = kCATransitionPush;
            transition.subtype = on ? kCATransitionFromLeft : kCATransitionFromRight
        case .CrossDissolve:
            transition.type = kCATransitionFade
        default:
            break;
        }
        return transition
    }
}
