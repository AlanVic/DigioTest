//
//  StoreViewModel.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import Foundation

class StoreViewModel {
	private let store: Store
	init(store: Store) {
		self.store = store
	}

	public func getProductViewModel() -> ProductsViewModel {
		return ProductsViewModel(products: store.products)
	}
}
