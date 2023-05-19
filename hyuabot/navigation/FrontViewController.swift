//
//  FrontViewController.swift
//  hyuabot
//
//  Created by 이정인 on 2023/05/09.
//

import UIKit

class FrontViewController: UIViewController {
    
    var delegate: RevealViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sideBarButton = UIBarButtonItem(
            image: UIImage(systemName: "line.horizontal.3"),
            style: .plain,
            target: self,
            action: #selector(openMenu(_:)))
        self.navigationItem.leftBarButtonItem = sideBarButton
        
        // Swipe guesture (Open)
        let openSwipeGuestureRecognizer = UIScreenEdgePanGestureRecognizer(
            target: self, action: #selector(openMenu))
        openSwipeGuestureRecognizer.edges = .left
        self.view.addGestureRecognizer(openSwipeGuestureRecognizer)
        
        // Swipe guesture (Close)
        let closeSwipeGuestureRecognizer = UISwipeGestureRecognizer(
            target: self, action: #selector(openMenu)
        )
        closeSwipeGuestureRecognizer.direction = .left
        self.view.addGestureRecognizer(closeSwipeGuestureRecognizer)
    }

    @objc func openMenu(_ sender: Any) {
        if self.delegate?.sideBarOpened == false {
            self.delegate?.openSideBar(nil)
        } else {
            self.delegate?.closeSideBar(nil)
        }
    }
}

