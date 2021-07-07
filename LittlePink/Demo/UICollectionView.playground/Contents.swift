//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    private let photos = ["1", "2", "3", "4"]
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 90, height: 90)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DynamicCell.self, forCellWithReuseIdentifier: "DynamicCellID")
        return collectionView
    }()
    
    override func loadView() {
        view.addSubview(collectionView)
        initContrations()
    }
    
    private func initContrations() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
}

extension MyViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dynamicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicCellID", for: indexPath) as! DynamicCell
        dynamicCell.avatarImageView.image = UIImage(named: photos[indexPath.item])
        return dynamicCell
    }
}

class DynamicCell : UICollectionViewCell {
    
    lazy var avatarImageView:UIImageView = {
      let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(avatarImageView)
        initContrations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("initCode")
    }
    
    private func initContrations() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
