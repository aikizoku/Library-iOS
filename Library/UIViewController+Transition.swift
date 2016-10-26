import Foundation
import UIKit

enum UIViewTransitionType {
    case none
    case present
    case push
    case crossDissolve
}

extension UIViewController {
    
    // MARK: - PresentViewController
    
    func presentForNavigation(viewController: UIViewController, transitionType: UIViewTransitionType, completion: @escaping () -> Void) {
        let navigationController = UINavigationController(rootViewController: viewController)
        present(viewController: navigationController, transitionType: transitionType, completion: completion)
    }
    
    func present(viewController: UIViewController, transitionType: UIViewTransitionType, completion: @escaping () -> Void) {
        var animated = false
        switch transitionType {
        case .present:
            animated = true
            viewController.modalTransitionStyle = .coverVertical
        case .push:
            view.window?.layer.add(UIViewController.transition(transitionType: transitionType, on: true), forKey: nil)
        case .crossDissolve:
            animated = true
            viewController.modalTransitionStyle = .crossDissolve
        default:
            break;
        }
        present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(transitionType: UIViewTransitionType, completion: @escaping () -> Void) {
        var animated = false
        switch transitionType {
        case .present:
            animated = true
            modalTransitionStyle = .coverVertical
        case .push:
            view.window?.layer.add(UIViewController.transition(transitionType: transitionType, on: false), forKey: nil)
        case .crossDissolve:
            animated = true
            modalTransitionStyle = .crossDissolve
        default:
            break;
        }
        dismiss(animated: animated, completion: completion)
    }
    
    // MARK: - PushViewController
    
    func pushViewController(viewController: UIViewController, transitionType: UIViewTransitionType) {
        if let navigationController = navigationController {
            var animated = false
            switch transitionType {
            case .present, .crossDissolve:
                navigationController.view.layer.add(UIViewController.transition(transitionType: transitionType, on: true), forKey: nil)
            case .push:
                animated = true
            default:
                break;
            }
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    func popViewController(transitionType: UIViewTransitionType) {
        if let navigationController = navigationController {
            var animated = false
            switch transitionType {
            case .present, .crossDissolve:
                navigationController.view.layer.add(UIViewController.transition(transitionType: transitionType, on: false), forKey: nil)
            case .push:
                animated = true
            default:
                break;
            }
            navigationController.popViewController(animated: animated)
        }
    }
    
    func popToViewController(viewController: UIViewController, transitionType: UIViewTransitionType) {
        if let navigationController = navigationController {
            var animated = false
            switch transitionType {
            case .present, .crossDissolve:
                navigationController.view.layer.add(UIViewController.transition(transitionType: transitionType, on: false), forKey: nil)
            case .push:
                animated = true
            default:
                break;
            }
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
    
    func popToRootViewController(transitionType: UIViewTransitionType) {
        if let navigationController = navigationController {
            var animated = false
            switch transitionType {
            case .present, .crossDissolve:
                navigationController.view.layer.add(UIViewController.transition(transitionType: transitionType, on: false), forKey: nil)
            case .push:
                animated = true
            default:
                break;
            }
            navigationController.popToRootViewController(animated: animated)
        }
    }
    
    // MARK: - Private
    
    static private func transition(transitionType: UIViewTransitionType, on: Bool) -> CATransition {
        let transition = CATransition();
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        switch transitionType {
        case .present:
            transition.type = kCATransitionMoveIn
            transition.subtype = on ? kCATransitionFromBottom : kCATransitionFromTop
        case .push:
            transition.type = kCATransitionPush;
            transition.subtype = on ? kCATransitionFromLeft : kCATransitionFromRight
        case .crossDissolve:
            transition.type = kCATransitionFade
        default:
            break;
        }
        return transition
    }
}
