import UIKit

class CardCell: UITableViewCell {
    
    static let identifier = "CardsCell"
    
    let userID = UILabel()
    let id = UILabel()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let body = UILabel()
    lazy var stack = VerticalStackView(arrangedSubViews: [title, body], spacing: 0, distribution: .none)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(stack)
        stack.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        title.numberOfLines = 0
        body.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardCell {
    func configCell(data: CardModel) {
        userID.text = String(data.userID)
        id.text = String(data.id)
        title.text = data.title
        body.text = data.body
    }
}
