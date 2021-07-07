//
//  DynamicVC_CollectionView.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/7.
//

import Foundation
import YPImagePicker
import SKPhotoBrowser
import AVKit

extension DynamicSendViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isVideo {
            let avPlayerVC = AVPlayerViewController()
            let avplaer = AVPlayer(url: videoUrl)
            avPlayerVC.player = avplaer
            present(avPlayerVC, animated: true) {
                avPlayerVC.player?.play()
            }
        } else {
            var images : [SKPhoto] = []
            for photo in photos {
                images.append(SKPhoto.photoWithImage(photo))
            }
            let bower = SKPhotoBrowser.init(photos: images, initialPageIndex: indexPath.item)
            SKPhotoBrowserOptions.displayDeleteButton = true
            SKPhotoBrowserOptions.displayCounterLabel = false
            bower.delegate = self
            present(bower, animated: true)
        }
   
    }
}

extension DynamicSendViewController: SKPhotoBrowserDelegate {
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        self.collectionView.reloadData()
        reload()
    }
}

extension DynamicSendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: KPhotoCellID, for: indexPath) as! PhotoCell
        photoCell.avatarView.image = photos[indexPath.item]
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KAddPhotoViewID, for: indexPath) as! AddPhotoView
            headerView.addPhotoBtn.addTarget(self, action: #selector(showAddPhotoVC), for: .touchUpInside)
            return headerView
        default:
        fatalError("colletionView header 没有实现")
        }
    }
}


extension DynamicSendViewController {
    @objc private func showAddPhotoVC() {
        if photoCount < KMaxCountPhotoCount {
            var config = YPImagePickerConfiguration()
            
            // MARK: 通用配置
            config.albumName = Bundle.main.appname //存图片进相册App的'我的相簿'里的文件夹名称
            config.screens = [.library] //依次展示相册，拍视频，拍照页面
            
            // MARK: 相册配置
            config.library.defaultMultipleSelection = true //是否可多选
            config.library.maxNumberOfItems = KMaxCountPhotoCount - photoCount //最大选取照片或视频数
            config.library.spacingBetweenItems = KWalterFallPadding //照片缩略图之间的间距
            
            // MARK: - Gallery(多选完后的展示和编辑页面)-画廊
            config.gallery.hidesRemoveButton = false //每个照片或视频右上方是否有删除按钮
            
            let picker = YPImagePicker(configuration: config)
            
            // MARK: 选完或按取消按钮后的异步回调处理（依据配置处理单个或多个）
            picker.didFinishPicking { [unowned picker] items, _ in
  
                for item in items {
                    if case let .photo(photo) = item{
                        self.photos.append(photo.image)
                    }
                }
                self.collectionView.reloadData()
                
                picker.dismiss(animated: true)
            }
            
            present(picker, animated: true)
        } else {
            hudText("当前最多只能选择\(KMaxCountPhotoCount)图片")
        }
    }
}
