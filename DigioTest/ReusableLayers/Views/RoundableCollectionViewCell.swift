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

    lazy var heightImageConstraint = imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1)
    lazy var widthImageConstraint = imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1)

	override init(frame: CGRect) {
		super.init(frame: frame)
        setupCell()
        setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCell() {
//		self.backgroundColor = .blue
        self.contentView.backgroundColor = .white
        contentView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        contentView.layer.masksToBounds = false

        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowOffset = CGSize(width: 1, height: 2)
        contentView.layer.shadowColor = UIColor.black.cgColor
	}

	func buildViewHierarchy() {
        contentView.addSubview(imageView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
            heightImageConstraint,
            widthImageConstraint,
			imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}

	public func setImageWith(url: URL) {
        imageView.downloaded(from: url, contentMode: .scaleAspectFill)
	}

    public func setTypeCell(_ typeCell: TypeRoundableCell) {
        switch typeCell {
        case .icon:
            let heightConstraintUpdate = heightImageConstraint.constraintWithMultiplier(0.4)
            contentView.removeConstraint(heightImageConstraint)
            contentView.addConstraint(heightConstraintUpdate)
            let widthConstraintUpdate = widthImageConstraint.constraintWithMultiplier(0.4)
            contentView.removeConstraint(widthImageConstraint)
            contentView.addConstraint(widthConstraintUpdate)
            contentView.layoutIfNeeded()
            heightImageConstraint = heightConstraintUpdate
            widthImageConstraint = widthConstraintUpdate
            imageView.contentMode = .scaleAspectFit
        case .banner:
            imageView.layer.cornerRadius = cornerRadius
            imageView.contentMode = .scaleAspectFill
        }
        imageView.layoutIfNeeded()
    }
}
