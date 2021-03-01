//
//  AlienView.swift
//  drawing
//
//  Created by Kate Baumstein on 3/1/21.
//

import Foundation
import UIKit

class AlienView: UIView{
    
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        //self.backgroundColor = UIColor.blue
        context?.setFillColor(UIColor.blue.cgColor)
        
        
        print("DRAWIN")
        context!.setLineWidth(2.0)
        context!.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 0, y: self.frame.size.height))
        context?.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        context!.strokePath()
    }
}
