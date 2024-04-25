//
//  CardsView.swift
//  CodingInterviewSampleProject2022
//
//  Created by Macbook on 22/03/2024.
//

import UIKit

class CardView: UIView {
    
    let cardTable = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupView()
    }
    
    private func setupView() {
        addSubview(cardTable)
        cardTable.anchor(top: topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
