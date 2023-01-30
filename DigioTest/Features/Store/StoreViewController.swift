//
//  StoreViewController.swift
//  DigioTest
//
//  Created by Alan Paulino on 28/01/23.
//

import UIKit

class StoreViewController: UIViewController {

	let storeView: UIView = {
		let view: UIView
		if let path = Bundle.main.path(forResource: "test", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let store = try JSONDecoder().decode(Store.self, from: data)
				view = StoreView(frame: .zero, viewModel: StoreViewModel(store: store))
			} catch {
				view = UIView()
				view.backgroundColor = .red
			}
		} else {
			view = UIView()
			view.backgroundColor = .blue
		}
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func loadView() {
		self.view = storeView
	}
}
