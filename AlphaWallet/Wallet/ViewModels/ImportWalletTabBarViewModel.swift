// Copyright © 2018 Stormbird PTE. LTD.

import UIKit

struct ImportWalletTabBarViewModel {
	var currentTab: ImportWalletTab

	init(tab: ImportWalletTab) {
		currentTab = tab
	}

	var backgroundColor: UIColor {
		return Colors.appBackground
	}

	func titleColor(for tab: ImportWalletTab) -> UIColor {
		return Colors.appWhite
	}

	var font: UIFont {
		return Fonts.regular(size: 10)!
	}

	var barUnhighlightedColor: UIColor {
		return UIColor(red: 122, green: 197, blue: 225)
	}

	var barHighlightedColor: UIColor {
		return Colors.appWhite
	}
}

