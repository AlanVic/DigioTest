//
//  ConfigurableView.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

protocol ConfigurableView: UIView {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ConfigurableView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
}
