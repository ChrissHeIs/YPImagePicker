//
//  PermissionCheckable.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 25/01/2018.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import UIKit

internal protocol YPPermissionCheckable {
    func doAfterLibraryPermissionCheck(block: @escaping (Bool) -> Void)
    func doAfterCameraPermissionCheck(block: @escaping () -> Void)
    func checkLibraryPermission()
    func checkCameraPermission()
}

internal extension YPPermissionCheckable where Self: UIViewController {
    func doAfterLibraryPermissionCheck(block: @escaping (Bool) -> Void) {
        YPPermissionManager.checkLibraryPermissionAndAskIfNeeded(sourceVC: self) { hasPermission, isLimited in
            if hasPermission {
                block(isLimited)
            } else {
                ypLog("Not enough permissions.")
            }
        }
    }
    
    func presentLimitedLibraryPicker() {
        YPPermissionManager.presentLimitedLibraryPicker(sourceVC: self)
    }

    func doAfterCameraPermissionCheck(block: @escaping () -> Void) {
        YPPermissionManager.checkCameraPermissionAndAskIfNeeded(sourceVC: self) { hasPermission, _ in
            if hasPermission {
                block()
            } else {
                ypLog("Not enough permissions.")
            }
        }
    }

    func checkLibraryPermission() {
        YPPermissionManager.checkLibraryPermissionAndAskIfNeeded(sourceVC: self) { _, _ in }
    }
    
    func checkCameraPermission() {
        YPPermissionManager.checkCameraPermissionAndAskIfNeeded(sourceVC: self) { _, _ in }
    }
}
