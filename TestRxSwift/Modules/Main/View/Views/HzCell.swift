import UIKit

class HzCell : UITableViewCell {
    
    static let cellIdHz = "hz"
    
    let HzLabelText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(HzLabelText)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        HzLabelText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        HzLabelText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        HzLabelText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    func configureCell(from data: DataClass) {
        self.HzLabelText.text = data.text
    }
}

