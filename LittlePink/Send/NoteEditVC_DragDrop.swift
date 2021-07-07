//
//  NoteEditVC_DragDrop.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/5.
//

import Foundation


extension DynamicSendViewController : UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let photo = photos[indexPath.row]
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object:photo))
        dragItem.localObject = photo
        return [dragItem]
    }
}

extension DynamicSendViewController : UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    ///手指放下的时候
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first,
           let soureceIndexpath = item.sourceIndexPath,
           let destinationIndexpath = coordinator.destinationIndexPath{
            collectionView.performBatchUpdates {
                photos.remove(at: soureceIndexpath.item)
                photos.insert(item.dragItem.localObject as! UIImage , at: destinationIndexpath.item)
                collectionView.moveItem(at: soureceIndexpath, to: destinationIndexpath)
            }
            coordinator.drop(item.dragItem, toItemAt: destinationIndexpath)
        }
    }
    
    
}
