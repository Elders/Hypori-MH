//
//  SkeletonView+ObjC.swift
//  Hypori-MH
//
//  Created by Milen Halachev on 26.07.21.
//

import Foundation
import SkeletonView


extension UIView {
    
    @objc public func showAnimatedGradientSkeletonObjC() {
        
        self.showAnimatedGradientSkeleton()
    }
    
    @objc public func hideSkeletonObjC() {
        
        self.hideSkeleton()
    }
}

extension UITableViewController: SkeletonTableViewDataSource {
    
    public func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 20
    }
    
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        
        return "CellID"
    }
}
