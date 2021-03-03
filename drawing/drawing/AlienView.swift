//
//  AlienView.swift
//  drawing
//
//  Created by Kate Baumstein on 3/1/21.
//

import Foundation
import UIKit

class AlienView: UIView{
    
    var shapex = 0
    var shapey = 0
    var dx = 1
    var dy = 1
    
    var shape = "square"
    var shapeDecider = 0
    
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
        
//        let color: UIColor = UIColor.yellow
//        let drect =  CGRect(x: shapex, y:shapey, width: 50, height: 50)
//        let bpath: UIBezierPath = UIBezierPath(rect: drect)
//        color.set()
//        bpath.stroke()
//        UIColor.blue.set()
//        UIRectFill(drect)
        
        if(shapeDecider == 0) {
            //yellow square
            let drect =  CGRect(x: shapex, y:shapey, width: 50, height: 50)
            let bpath: UIBezierPath = UIBezierPath(rect: drect)
            UIColor.yellow.set()
            UIRectFill(drect)
            //shapeDecider = 1
        }
//        if(shapeDecider == 1){
//            //blue circle
//            var cpath = UIBezierPath()
//            cpath = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 100))
//            UIColor.yellow.setStroke()
//            UIColor.red.setFill()
//            cpath.lineWidth = 5
//            cpath.stroke()
//            cpath.fill()
//            shapeDecider = 1
//
//        }
        
    }
    
    @objc func update(){  //do collision detection here
        shapex += dx
        shapey += dy
//        if(shapex < 0){
//            dx = -dx
//        }
//        if(shapey < 0) {
//            dy = -dy
//        }
        if (shapex > Int(self.bounds.maxX)){
            dx = -dx
        }
        if(shapey >  Int(self.bounds.maxY)){
            dy = -dy
        }
        if (shapex < Int(self.bounds.minX)){
            dx = -dx
        }
        if(shapey <  Int(self.bounds.minY)){
            dy = -dy
        }
        
        setNeedsDisplay()  //calls draw function (like a flag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let point = t.location(in: self)
            shapex = Int(point.x)
            shapey = Int(point.y)
            
        }
        
        
        
    }
    
}
