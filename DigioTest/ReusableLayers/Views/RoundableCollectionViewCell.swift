//
//  RoundableCollectionViewCell.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class RoundableCollectionViewCell: UICollectionViewCell, ConfigurableView {
	private let cornerRadius: CGFloat = 16.0

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setupCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCell() {
		self.backgroundColor = .white

		self.layer.cornerRadius = cornerRadius
		self.clipsToBounds = false

		self.layer.shadowRadius = 2
		self.layer.shadowOpacity = 0.4
		self.layer.shadowOffset = CGSize(width: 1, height: 2)
		self.layer.shadowColor = UIColor.black.cgColor
	}

	func buildViewHierarchy() {
		addSubview(imageView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
			imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
			imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
	}

	public func setImageWith(url: URL) {
		imageView.downloaded(from: url)
	}
}
