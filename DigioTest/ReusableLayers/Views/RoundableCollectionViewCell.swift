//
//  RoundableCollectionViewCell.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class RoundableCollectionViewCell: UICollectionViewCell {
	private let cornerRadius: CGFloat = 8.0

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()


	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCell() {
		self.layer.cornerRadius = cornerRadius
		self.clipsToBounds = true

		self.layer.shadowRadius = 8
		self.layer.shadowOpacity = 1.0
		self.layer.shadowOffset = CGSize(width: 3, height: 3)
		self.layer.shadowColor = UIColor.black.cgColor
	}


	public func setImageWith(url: URL) {
		imageView.downloaded(from: url)
	}
}
