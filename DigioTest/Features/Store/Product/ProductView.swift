//
//  ProductView.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class ProductView: UIView, ConfigurableView {

	lazy var collectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero)
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.backgroundColor = .red
		return collection
	}()

	let viewModel: ProductsViewModel

	public var didSelectedProduct: ((ProductsViewModel) -> Void)?

	init(frame: CGRect, viewModel: ProductsViewModel) {
		self.viewModel = viewModel
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func buildViewHierarchy() {
		addSubview(collectionView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: self.topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
}
