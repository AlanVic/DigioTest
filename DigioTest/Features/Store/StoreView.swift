//
//  StoreView.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class StoreView: UIView, ConfigurableView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .white
		buildViewHierarchy()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func buildViewHierarchy() {

	}

	func setupConstraints() {

	}
}
