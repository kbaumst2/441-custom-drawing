//
//  AlienView.swift
//  drawing
//
//  Created by Kate Baumstein on 3/1/21.
//

import Foundation
import UIKit

class AlienView: UIView{
    
    var alienx = 0
    var alieny = 0
    
    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        //self.backgroundColor = UIColor.blue
//        context?.setFillColor(UIColor.blue.cgColor)
//
//
//        print("DRAWIN")
//        context!.setLineWidth(2.0)
//        context!.setStrokeColor(UIColor.blue.cgColor)
//        context?.move(to: CGPoint(x: 0, y: self.frame.size.height))
//        context?.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
//        context!.strokePath()
        
        let color: UIColor = UIColor.yellow
        let drect =  CGRect(x: alienx, y:alieny, width: 50, height: 50)
        let bpath: UIBezierPath = UIBezierPath(rect: drect)
        color.set()
        bpath.stroke()
        UIColor.blue.set()
        UIRectFill(drect)
        
    }
    
    @objc func update(){  //do collision detection here
        alienx += 1
        alieny += 1
        setNeedsDisplay()  //calls draw function (like a flag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let point = t.location(in: self)
            alienx = Int(point.x)
            alieny = Int(point.y)
            
        }
    }
    
}
