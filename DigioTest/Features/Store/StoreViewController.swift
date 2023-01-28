//
//  StoreViewController.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class StoreViewController: UIViewController {

	let storeView = StoreView(frame: .zero, viewModel: <#T##StoreViewModel#>)

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func loadView() {
		self.view = storeView
	}
}
