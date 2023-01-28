//
//  ProductViewModel.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import Foundation

struct ProductsViewModel {
	private let products: [Product]
	init(products: [Product]) {
		self.products = products
	}

	func numberOfItems -> Int {
		return products.count
	}
}
