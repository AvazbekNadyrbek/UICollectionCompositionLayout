import UIKit

class NewsCell: UICollectionViewCell, CellPtotocol {
    
    static var reuseIdentifier: String = "NewsCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.1
        
        contentView.addSubview(imageView)
        contentView.addSubview(headerLabel)
        contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            headerLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 15),
            headerLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            headerLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            
            textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor, constant: 0),
            textLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 0),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    func setUpCell(item: CollectionItem) {
        imageView.image = UIImage(named: item.image)
        headerLabel.text = item.header
        textLabel.text = item.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
