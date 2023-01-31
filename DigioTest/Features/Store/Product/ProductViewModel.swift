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

	public func numberOfItems() -> Int {
		return products.count
	}

	public func imageFromItem(_ indexPath: IndexPath) -> String {
		return products[indexPath.row].imageURL
	}

    public func titleProductSection() -> String {
        return "Produtos"
    }
}
