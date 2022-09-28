//
//  YPPermissionDeniedPopup.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 12/03/2018.
//  Copyright © 2018 Yummypets. All rights reserved.
//

import UIKit

internal struct YPPermissionDeniedPopup {
    static func buildGoToSettingsAlert(cancelBlock: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title:
                                        YPConfig.wordings.permissionPopup.title,
                                      message: YPConfig.wordings.permissionPopup.message,
                                      preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: YPConfig.wordings.permissionPopup.cancel,
                          style: UIAlertAction.Style.cancel,
                          handler: { _ in
                            cancelBlock()
                          }))
        alert.addAction(
            UIAlertAction(title: YPConfig.wordings.permissionPopup.grantPermission,
                          style: .default,
                          handler: { _ in
                              Self.goToSettings()
                          }))
        return alert
    }
    
    static func buildManageLimitedAccessAlert(selectMoreBlock: @escaping () -> Void) -> UIAlertController {
        
        let alert = UIAlertController(title: YPConfig.wordings.manageLimitedAccessPopup.title,
                                      message: YPConfig.wordings.manageLimitedAccessPopup.message,
                                            preferredStyle: .actionSheet)
        
        let selectPhotosAction = UIAlertAction(title: YPConfig.wordings.manageLimitedAccessPopup.selectMore,
                                               style: .default) { _ in
            selectMoreBlock()
        }
        alert.addAction(selectPhotosAction)
        
        let allowFullAccessAction = UIAlertAction(title: YPConfig.wordings.manageLimitedAccessPopup.goToSettings,
                                                  style: .default) { _ in
            Self.goToSettings()
        }
        alert.addAction(allowFullAccessAction)
        
        let cancelAction = UIAlertAction(title: YPConfig.wordings.manageLimitedAccessPopup.cancel, style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        return alert
    }
    
    private static func goToSettings() {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        } else {
            UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
        }
    }
}
