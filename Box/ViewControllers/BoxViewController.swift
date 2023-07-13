//
//  BoxViewController.swift
//  Box
//
//  Created by Marat Shagiakhmetov on 12.07.2023.
//

import UIKit

class BoxViewController: UIViewController {
    private lazy var redView: UIView = {
        let view = setupView(color: .systemRed)
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = setupView(color: .systemGreen)
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = setupView(color: .systemBlue)
        return view
    }()
    
    private lazy var yellowView: UIView = {
        let view = setupView(color: .systemYellow)
        return view
    }()
    
    private var redLeading: NSLayoutConstraint!
    private var greenLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        setupSubviews(subviews: redView, greenView)
        setupConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            redLeading.constant = view.frame.height / 2
            greenLeading.constant = view.frame.height / 2
            setupSubviews(subviews: blueView, yellowView)
            setupConstraintsForAddSubviews()
        } else {
            redLeading.constant = 20
            greenLeading.constant = 20
            removeSubviews(subviews: blueView, yellowView)
        }
    }
    
    private func setupDesign() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func removeSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}
// MARK: - Constraints
extension BoxViewController {
    private func setupConstraints() {
        redLeading = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        greenLeading = greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redLeading,
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            redView.heightAnchor.constraint(equalTo: greenView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20),
            greenLeading,
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupConstraintsForAddSubviews() {
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -20),
            blueView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -20),
            blueView.heightAnchor.constraint(equalTo: redView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yellowView.trailingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: -20),
            yellowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
// MARK: - Subviews
extension BoxViewController {
    private func setupView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
