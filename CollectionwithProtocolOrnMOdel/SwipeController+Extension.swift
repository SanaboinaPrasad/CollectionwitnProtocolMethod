//
//  SwipeController+Extension.swift
//  CollectionViewPaginationWithbottomControls
//
//  Created by Sriram Prasad on 03/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
extension SWipeController{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentSize = .zero
                
            }
            else {
                let indexpath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
                
            }
            
        }) { (_) in
            
        }
    }
    
    
    
    
}
