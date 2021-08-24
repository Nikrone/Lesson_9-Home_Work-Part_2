//
//  ViewController.swift
//  Lesson_9-Home_Work-Part_2
//
//  Created by Evgeniy Nosko on 24.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    let movingRedView =  UIView (frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
    var initialCenter: CGPoint = .zero
    let appName = UILabel(frame: CGRect(x: 145, y: 50, width: 150, height: 40))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movingRedView.backgroundColor = UIColor.red
        movingRedView.layer.cornerRadius = 50
        movingRedView.layer.shadowColor = UIColor.black.cgColor
        movingRedView.layer.shadowOffset = CGSize(width: 1, height: 1)
        movingRedView.layer.shadowRadius = 15
        movingRedView.layer.shadowOpacity = 0.7
        movingRedView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(movingRedView)
        movingRedView.center = view.center
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        movingRedView.addGestureRecognizer(panGestureRecognizer)
        
        appName.text = "Stubborn Ball"
        view.addSubview(appName)
    }
    
    @objc private func didPan(_ sender:UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            initialCenter = movingRedView.center
        case .changed:
            let translation = sender.translation(in: view)
            
            movingRedView.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            
        //  view возвращается на начальную позицию
        case .ended,
             .cancelled:
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                self.movingRedView.center = self.view.center
            }
        default:
            break
        }
    }
    
}
