//
//  IndicatorViewController.swift
//  RainAlarm
//
//  Created by artem on 21.02.2023.
//

import UIKit

class IndicatorViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    let backgroundView = UIView()
    
    func activityIndicatorStart() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.isUserInteractionEnabled = false
        
        backgroundView.backgroundColor = .gray
        backgroundView.alpha = 0.5
        backgroundView.addSubview(activityIndicator)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func activityIndicatorStop() {
        self.activityIndicator.stopAnimating()
        activityIndicator.isUserInteractionEnabled = true
        self.backgroundView.removeFromSuperview()
    }
    
}
