import UIKit
import Kingfisher

class PictureCell : UITableViewCell {
    
    static let cellIdPicture = "picture"
    
    private var downloadTask: DownloadTask?
    
    let pictureTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pictureImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(pictureTextLabel)
        self.addSubview(pictureImageView)
        
        self.setupUI()
        
        pictureImageView.image = nil
        downloadTask?.cancel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        pictureTextLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pictureTextLabel.bottomAnchor.constraint(equalTo: pictureImageView.topAnchor).isActive = true
        pictureTextLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pictureTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        
        pictureImageView.topAnchor.constraint(equalTo: pictureTextLabel.bottomAnchor).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pictureImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    func configureCell(from data: DataClass) {
        self.pictureTextLabel.text = data.text
        
        if let imageUrlString = data.url, let imageUrl = URL(string: imageUrlString) {
            self.pictureImageView.kf.setImage(with: imageUrl)
        }
    }
}

