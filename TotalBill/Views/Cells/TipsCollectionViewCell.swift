//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by Назар Ткаченко on 25.08.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UIProperties
    lazy var procentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.5568627451, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
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
        procentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
    }
    
    //MARK: - Private methods
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        layer.cornerRadius = 10
        addSubview(procentLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
