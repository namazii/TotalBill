//
//  TipsView.swift
//  TotalBill
//
//  Created by Назар Ткаченко on 25.08.2022.
//

import UIKit

class TipsView: UIView {
    
    //MARK: - Private UIProperties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Tips".localized()
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
       let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = #colorLiteral(red: 0, green: 0.6313847303, blue: 0.6039733291, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    //MARK: - Properties
    private let tipsArray = ["0%", "5%", "10%", "15%", "20%", "25%", "30%", "35%"]
    var tipsCount = 0
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 25)
    }
    
    //MARK: - Private methods
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: - Extension DataSource
extension TipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.procentLabel.text = tipsArray[indexPath.row]
        
        return cell
    }
}

//MARK: - Extension Delegate
extension TipsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1 :
            tipsCount = 5
        case 2:
            tipsCount = 10
        case 3 :
            tipsCount = 15
        case 4:
            tipsCount = 20
        case 5:
            tipsCount = 25
        case 6:
            tipsCount = 30
        case 7:
            tipsCount = 35
        default:
            tipsCount = 0
        }
    }
}

//MARK: - FlowLayout
extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/5,
               height: collectionView.frame.width/5)
    }
}

//MARK: - Constraints
extension TipsView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
