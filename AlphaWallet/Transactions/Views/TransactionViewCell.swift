// Copyright SIX DAY LLC. All rights reserved.

import UIKit

class TransactionViewCell: UITableViewCell {
    static let identifier = "TransactionTableViewCell"

    private let background = UIView()
    private let statusImageView = UIImageView()
    private let titleLabel = UILabel()
    private let amountLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let blockchainLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false

        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.contentMode = .scaleAspectFit

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.lineBreakMode = .byTruncatingMiddle

        amountLabel.textAlignment = .right
        amountLabel.translatesAutoresizingMaskIntoConstraints = false

        let leftStackView = [
            titleLabel,
            subTitleLabel,
        ].asStackView(axis: .vertical, distribution: .fillProportionally, spacing: 0)
        leftStackView.translatesAutoresizingMaskIntoConstraints = false

        blockchainLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        blockchainLabel.setContentHuggingPriority(.required, for: .vertical)
        let rightStackView = [
            blockchainLabel,
            amountLabel,
        ].asStackView(axis: .vertical, alignment: .trailing)
        rightStackView.translatesAutoresizingMaskIntoConstraints = false

        let stackView = [statusImageView, leftStackView, rightStackView].asStackView(spacing: 15)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        statusImageView.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        subTitleLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        titleLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)

        amountLabel.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        stackView.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)

        background.addSubview(stackView)

        NSLayoutConstraint.activate([
            statusImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 26),

            stackView.anchorsConstraint(to: background, edgeInsets: .init(top: 10, left: StyleLayout.sideMargin, bottom: 10, right: StyleLayout.sideMargin)),

            background.anchorsConstraint(to: contentView),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: TransactionCellViewModel) {
        selectionStyle = .none
        background.backgroundColor = viewModel.contentsBackgroundColor
        background.layer.cornerRadius = viewModel.contentsCornerRadius

        statusImageView.image = viewModel.statusImage

        titleLabel.text = viewModel.title
        titleLabel.font = viewModel.titleFont

        subTitleLabel.text = viewModel.subTitle
        subTitleLabel.textColor = viewModel.subTitleTextColor
        subTitleLabel.font = viewModel.subTitleFont

        blockchainLabel.textAlignment = viewModel.blockChainNameTextAlignment
        blockchainLabel.cornerRadius = 7
        blockchainLabel.backgroundColor = viewModel.blockChainNameBackgroundColor
        blockchainLabel.textColor = viewModel.blockChainNameColor
        blockchainLabel.font = viewModel.blockChainNameFont
        blockchainLabel.text = viewModel.blockChainName

        amountLabel.attributedText = viewModel.amountAttributedString
        amountLabel.font = viewModel.amountFont

        backgroundColor = viewModel.backgroundColor
    }
}
