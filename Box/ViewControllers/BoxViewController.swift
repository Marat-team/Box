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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        setupSubviews(subviews: redView, greenView)
        setupConstraints()
    }
    
    private func setupDesign() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
}
// MARK: - Constraints
extension BoxViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            redView.heightAnchor.constraint(equalTo: greenView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        /*
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -40),
            blueView.heightAnchor.constraint(equalTo: redView.heightAnchor),
            blueView.widthAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 20),
            yellowView.trailingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: -40),
            yellowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            yellowView.heightAnchor.constraint(equalTo: greenView.heightAnchor),
            yellowView.widthAnchor.constraint(equalTo: greenView.widthAnchor)
        ])
         */
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
