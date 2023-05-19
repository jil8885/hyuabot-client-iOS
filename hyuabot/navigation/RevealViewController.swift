//
//  RevealViewController.swift
//  hyuabot
//
//  Created by 이정인 on 2023/05/16.
//

import UIKit

class RevealViewController : UIViewController {
    var contentViewController: UIViewController?
    var sideBarViewController: UIViewController?
    
    var sideBarOpened = false
    
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH = 260

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            self.contentViewController = vc
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParent: self)
            
            let frontViewController = vc.viewControllers[0] as? FrontViewController
            frontViewController?.delegate = self
        }
    }
    
    func getSideView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") {
            self.sideBarViewController = vc
            self.addChild(vc)
            self.view.addSubview(vc.view)
            vc.didMove(toParent: self)
            self.view.bringSubviewToFront((self.contentViewController?.view)!)
        }
    }
    
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        if (shadow == true){
            self.contentViewController?.view.layer.cornerRadius = 10
            self.contentViewController?.view.layer.shadowOpacity = 0.8
            self.contentViewController?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentViewController?.view.layer.shadowOffset = CGSize(width: offset, height: offset)
        } else {
            self.contentViewController?.view.layer.cornerRadius = 0
            self.contentViewController?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    func openSideBar(_ complete: (() -> Void)? ) {
        self.getSideView()
        self.setShadowEffect(shadow: true, offset: -2)
        
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        UIView.animate(
            withDuration: TimeInterval(self.SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations: {
                self.contentViewController?.view.frame = CGRect(x: CGFloat(self.SIDEBAR_WIDTH), y: 0, width: self.view.frame.width, height: self.view.frame.height)
            },
            completion: {
                if $0 == true {
                    self.sideBarOpened = true
                    complete?()
                }
            }
        )
    }
    
    func closeSideBar(_ complete: (() -> Void)? ) {
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        UIView.animate(
            withDuration: TimeInterval(self.SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations: {
                self.contentViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            },
            completion: {
                if $0 == true {
                    self.sideBarViewController?.view.removeFromSuperview()
                    self.sideBarViewController = nil
                    self.sideBarOpened = false
                    self.setShadowEffect(shadow: false, offset: 0)
                    complete?()
                }
            }
        )
    }
}
