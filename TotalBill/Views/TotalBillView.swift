//
//  TotalBillView.swift
//  TotalBill
//
//  Created by Назар Ткаченко on 25.08.2022.
//

import UIKit

class TotalBillView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Total  Bill "
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var summTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9411764706, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tintColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.5568627451, alpha: 1)
        textField.font = UIFont(name: "Avenir Next Bold", size: 48)
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(titleLabel)
        addSubview(summTextField)
        
//        backgroundColor = .red
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            summTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            summTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            summTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            summTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
