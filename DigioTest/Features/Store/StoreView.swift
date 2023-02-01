//
//  StoreView.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class StoreView: UIView, ConfigurableView {

    lazy var spotlightView: SpotlightView = {
        let view = SpotlightView(frame: .zero, viewModel: self.viewModel.getSpotlightViewModel())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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
        addSubview(spotlightView)
		addSubview(productView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
            spotlightView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            spotlightView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            spotlightView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            spotlightView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * viewModel.factorHeightSize()),

            productView.topAnchor.constraint(equalTo: spotlightView.bottomAnchor, constant: 32),
			productView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			productView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			productView.heightAnchor.constraint(equalToConstant: 180)
		])
	}
}
