//
//  EasyButton.swift
//  EasyButton
//
//  Created by Chris Price on 5/28/20.
//  Copyright © 2020 com.chrispriiice. All rights reserved.
//

import UIKit

class EasyButton: UIControl {

    private var easyButton: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    private func setUpViews() {
        easyButton.translatesAutoresizingMaskIntoConstraints = false
        let radius = self.frame.width / 2
        easyButton.layer.cornerRadius = radius
        easyButton.layer.borderWidth = 20
        easyButton.layer.borderColor = UIColor.lightGray.cgColor
        easyButton.backgroundColor = .red
        easyButton.isUserInteractionEnabled = false
        
        addSubview(easyButton)
        
        NSLayoutConstraint.activate([
            easyButton.widthAnchor.constraint(equalToConstant: self.frame.width),
            easyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            easyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            easyButton.heightAnchor.constraint(equalTo: easyButton.widthAnchor)
        ])
        
        let easyLabel = UILabel()
        easyLabel.translatesAutoresizingMaskIntoConstraints = false
        easyLabel.textAlignment = .center
        easyLabel.text = "easy"
        easyLabel.font = UIFont.systemFont(ofSize: 96)
        easyLabel.textColor = .white
        
        addSubview(easyLabel)
        
        NSLayoutConstraint.activate([
            easyLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            easyLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            easyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            easyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return false
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        sendActions(for: .touchUpInside)
    }
}
