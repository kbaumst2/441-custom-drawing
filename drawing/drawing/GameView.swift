//
//  AlienView.swift
//  drawing
//
//  Created by Kate Baumstein on 3/1/21.
//

import Foundation
import UIKit

class GameView: UIView{
    
    var ballx = 0
    var bally = 20
    var linex = 0
    var liney = 300
    var ballMove = false
    var count = 0
    var finaly = 0
    var random = 300
    var speed = 3
    var level = 0
    var updateLevel = false
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!


    override func draw(_ rect: CGRect) {
        
        
        
        //line at a random y within bounds of UIView
        linex = Int(self.bounds.maxX) - 100
     //   var liney = Int.random(in: Int(self.bounds.minY) + 40 ... Int(self.bounds.maxY) - 40)
//        liney = 300
        let drect =  CGRect(x: linex , y: liney, width: 100, height: 10)
        let bpath: UIBezierPath = UIBezierPath(rect: drect)
        UIColor.yellow.set()
        UIRectFill(drect)
        

        var cpath = UIBezierPath()
        ballx = (Int(self.bounds.maxX ) / 2) - 12
        cpath = UIBezierPath(ovalIn: CGRect(x:ballx , y: bally, width: 25, height: 25))
        UIColor.yellow.setStroke()
        UIColor.red.setFill()
        cpath.lineWidth = 5
        cpath.stroke()
        cpath.fill()

        
    }
    
    @objc func update(){  //do collision detection here
        print("updating")
        print("ball move: " + String(ballMove))
        if(count > 2){
            print("reset")
            bally = 20
            count = 0
            if(updateLevel == true){
                level += 1
                updateLevel = false
            }
        }
        levelLabel.text = "Level: " + String(level)
        if(count == 0 ){
            liney = random
            directionsLabel.text = "Click anywhere on the screen to begin. \nClick to try to stop the ball as close as you can to the line"
            
        }
        if(count == 2 ) {
//            directionsLabel.text = "This will hold results"
//            directionsLabel.text = String(finaly) + " ; " + String(liney)
            if(finaly < liney + 15 && finaly > liney - 15){
                directionsLabel.text = "Congratulations! You are moving onto the next level \nClick to try again"
                print("SUCCESS")
                updateLevel = true
                levelLabel.text = "Level: " + String(level+1)
            }
            else{
                directionsLabel.text = "You did not stop the ball close enough to the line. \nClick to try again"
            }
        }
        else if(count % 2 == 1){
            print("moving")
            directionsLabel.text = ""
            bally += speed + level
        }
        setNeedsDisplay()  //calls draw function (like a flag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        for t in touches {
            let point = t.location(in: self)
            print("in for loop")
            count += 1
            finaly = bally
            random = Int.random(in: Int(self.bounds.minY) + 70 ... Int(self.bounds.maxY) - 40)
//            if(count == 2){
//                finaly = Int(point.y)
//            }
            
    //        bally = 200
//            if(bally == 20){
//                ballMove = true
//            }
//            if(ballMove == false){
//                print("changing to true")
//                ballMove = true
//            }
//            if(ballMove == true){
//                ballMove = false
//            }
//            shapex = Int(point.x)
//            shapey = Int(point.y)
            
        }
        
        
        
    }
    
}
