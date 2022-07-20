import UIKit

class SelectorCell : UITableViewCell {
    
    static let cellIdSelector = "selector"
    
    let SelectorText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let idText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(SelectorText)
        self.addSubview(idText)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        SelectorText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        SelectorText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        SelectorText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        idText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        idText.widthAnchor.constraint(equalToConstant: 100).isActive = true
        idText.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
    }
    
    func configureCell(from data: Variant) {
        self.SelectorText.text = data.text
        self.idText.text = String(data.id)
    }
}


