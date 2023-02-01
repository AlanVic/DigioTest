//
//  SpotlightViewModel.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import Foundation

struct SpotlightViewModel {
	private let spotlights: [Spotlight]
	init(spotlights: [Spotlight]) {
		self.spotlights = spotlights
	}

    public func imageFromItem(_ indexPath: IndexPath) -> String {
        return spotlights[indexPath.row].bannerURL
    }

    public func numberOfItems() -> Int {
        return spotlights.count
    }
}
