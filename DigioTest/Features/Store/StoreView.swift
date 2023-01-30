//
//  StoreView.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class StoreView: UIView, ConfigurableView {

	lazy var productView: ProductView = {
		let view = ProductView(frame: .zero,
							   viewModel: self.viewModel.getProductViewModel())
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	let viewModel: StoreViewModel


	init(frame: CGRect, viewModel: StoreViewModel) {
		self.viewModel = viewModel
		super.init(frame: frame)
		self.backgroundColor = .white
		buildViewHierarchy()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func buildViewHierarchy() {
		addSubview(productView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			productView.topAnchor.constraint(equalTo: self.topAnchor),
			productView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			productView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			productView.heightAnchor.constraint(equalToConstant: 100)
		])
	}
}
