//
//  PersonsView.swift
//  TotalBill
//
//  Created by Назар Ткаченко on 25.08.2022.
//

import UIKit

class PersonsView: UIView {
    
    //MARK: - UIProperties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Persons".localized()
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var backgroundGrayView: UIView = {
        let view = UIView()
       
        view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9411764706, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.isEnabled = false
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)

        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        
        label.text = "2"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Properties
    var counter = 2
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 25)
    }
    
    //MARK: - Private methods
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    //MARK: - Actions
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter <= 2 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    //MARK: - Constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
    }
}
