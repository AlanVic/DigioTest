//
//  StoreViewController.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class StoreViewController: UIViewController {

	let storeView = StoreView()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func loadView() {
		self.view = storeView
	}
}
