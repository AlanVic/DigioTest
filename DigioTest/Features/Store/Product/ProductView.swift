//
//  ProductView.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class ProductView: UIView, ConfigurableView {

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		layout.estimatedItemSize = .zero
		let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.dataSource = self
        collection.delegate = self
		return collection
	}()

	let viewModel: ProductsViewModel

	public var didSelectedProduct: ((ProductsViewModel) -> Void)?

	init(frame: CGRect, viewModel: ProductsViewModel) {
		self.viewModel = viewModel
		super.init(frame: frame)
		setupView()
		setupCollection()
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

	func setupCollection() {
		collectionView.register(RoundableCollectionViewCell.self, forCellWithReuseIdentifier: "productCell")
	}
}

extension ProductView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell",
															for: indexPath) as? RoundableCollectionViewCell,
			  let imageURL = URL(string: viewModel.imageFromItem(indexPath)) else {
			return UICollectionViewCell()
		}

		cell.setImageWith(url: imageURL)
		return cell

	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfItems()
	}

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.size.height - 8, height: collectionView.frame.size.height - 8)
	}
}
