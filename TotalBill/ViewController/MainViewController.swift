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
//        label.font = UIFont(name: "Avenir Next Bold", size: 40)
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
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.5568627451, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var totalBillView = TotalBillView()
    lazy var personsView = PersonsView()
    lazy var tipsView = TipsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        addTap()
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6313847303, blue: 0.6039733291, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)
        
        view.addSubview(LogoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.summTextField.text,
              let totalBillInt = Int(totalBill) else { return }
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        
        if persons == 0 {
            descriptionLabel.text = "Enter persons count"
            descriptionLabel.textColor = .red
        } else {
            let result = summ / persons
            descriptionLabel.text = "\(result) per person"
            descriptionLabel.textColor = .black
        }
    }

    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
}
extension MainViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            LogoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            LogoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
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
            personsView.heightAnchor.constraint(equalToConstant: 130),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalToConstant: 130),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 5),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

