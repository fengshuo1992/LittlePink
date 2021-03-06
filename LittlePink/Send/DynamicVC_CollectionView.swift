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
        fatalError("colletionView header ????????????")
        }
    }
}


extension DynamicSendViewController {
    @objc private func showAddPhotoVC() {
        if photoCount < KMaxCountPhotoCount {
            var config = YPImagePickerConfiguration()
            
            // MARK: ????????????
            config.albumName = Bundle.main.appname //??????????????????App???'????????????'?????????????????????
            config.screens = [.library] //?????????????????????????????????????????????
            
            // MARK: ????????????
            config.library.defaultMultipleSelection = true //???????????????
            config.library.maxNumberOfItems = KMaxCountPhotoCount - photoCount //??????????????????????????????
            config.library.spacingBetweenItems = KWalterFallPadding //??????????????????????????????
            
            // MARK: - Gallery(????????????????????????????????????)-??????
            config.gallery.hidesRemoveButton = false //???????????????????????????????????????????????????
            
            let picker = YPImagePicker(configuration: config)
            
            // MARK: ???????????????????????????????????????????????????????????????????????????????????????
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
            hudText("????????????????????????\(KMaxCountPhotoCount)??????")
        }
    }
}
