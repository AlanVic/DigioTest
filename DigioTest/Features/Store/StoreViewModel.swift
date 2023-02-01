//
//  StoreViewModel.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import Foundation

class StoreViewModel {
    private let imageWidthSpotlight: CGFloat = 670
    private let imageHeightSpotlight: CGFloat = 320

	private let store: Store
	init(store: Store) {
		self.store = store
	}

	public func getProductViewModel() -> ProductsViewModel {
		return ProductsViewModel(products: store.products)
	}

    public func getSpotlightViewModel() -> SpotlightViewModel {
        return SpotlightViewModel(spotlights: store.spotlight)
    }

    public func factorHeightSize() -> CGFloat {
        return imageHeightSpotlight / imageWidthSpotlight
    }
}
