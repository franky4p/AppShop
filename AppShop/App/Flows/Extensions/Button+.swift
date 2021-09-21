//
//  Button+.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 21.09.2021.
//

import UIKit

extension UIButton {
    open override func endTracking(_ touch: UITouch?,with event: UIEvent?) {
        super .endTracking(touch, with: event)
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(self.isHighlighted ? 0.3 : 0.8)
        }, completion: { _ in self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.8)})
    
    }
}
