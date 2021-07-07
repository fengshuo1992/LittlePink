//
//  BaseTabbarViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/14.
//

import UIKit
import YPImagePicker

class BaseTabbarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PublishViewController {
          
            var config = YPImagePickerConfiguration()
            ///是否可以滚动切换
            config.isScrollToChangeModesEnabled = false
            ///是否设置图片为正方形
            config.onlySquareImagesFromCamera = false
            ///是否使用前置摄像头
            config.usesFrontCamera = false
            ///图片是否展示滤镜
            config.showsPhotoFilters = true
            ///视频剪辑的步骤
            config.showsVideoTrimmer = true
            ///是否展示保存图片的按钮
            config.shouldSaveNewPicturesToAlbum = true
            ///设置保存相片的分组的名称
            config.albumName = Bundle.main.appname;
            ///默认停留在那个bar上
            config.startOnScreen = .video
            ///有几个选项
            config.screens = [.library, .photo, .video]
            config.showsCrop = .none
            ///目标image的大小
//            config.targetImageSize = YPImageSize.original
            ///在视图上需要覆盖的视图
//            config.overlayView = UIView()
            config.hidesStatusBar = true
            ///隐藏底部的tabbar
            config.hidesBottomBar = false
            ///隐藏取消按钮
            config.hidesCancelButton = false
            ///status bar的样式
//            config.preferredStatusBarStyle = UIStatusBarStyle.default
//            config.bottomMenuItemSelectedColour = UIColor(r: 38, g: 38, b: 38)
//            config.bottomMenuItemUnSelectedColour = UIColor(r: 153, g: 153, b: 153)
//            config.filters = [DefaultYPFilters...]
            ///相机可以变焦的大小
            config.maxCameraZoomFactor = 5.0
//            config.preSelectItemOnMultipleSelection = true
//            config.fonts..
            
    
            config.library.isSquareByDefault = true
            config.library.mediaType = YPlibraryMediaType.photo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = 9
            config.library.minNumberOfItems = 1
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 2.0
            config.library.skipSelectionsGallery = false
            config.library.preSelectItemOnMultipleSelection = false
            
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
                    print(photo.originalImage) // original image selected by the user, unfiltered
                    print(photo.modifiedImage) // Transformed image, can be nil
                    print(photo.exifMeta) // Print exif meta data of original image.
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            return false
        }
        return true;
    }
    

}
