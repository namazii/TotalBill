//
//  MainViewController.swift
//  TotalBill
//
//  Created by Назар Ткаченко on 25.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Total  Bill "
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var LogoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "bill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //шрифт будет  изменяться в зависимости от ширины
        
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var totalBillView = TotalBillView()
    lazy var personsView = PersonsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6313847303, blue: 0.6039733291, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(LogoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
    }
    


}
extension MainViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            LogoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            LogoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            descriptionLabel.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 15),
//            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 130),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
}

