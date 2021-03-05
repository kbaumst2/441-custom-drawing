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
    var reset = false
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    
    

    override func draw(_ rect: CGRect) {
        //line at a random y within bounds of UIView
        linex = Int(self.bounds.maxX) - 100
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
    
    @IBAction func clickResetButton(sender: UIButton){
        count = 0
        level = 0
        bally = 20
    }
    
    @objc func update(){  //do collision detection here
        print("updating")
        if(count > 2){
            print("reset ball")
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
            if(finaly < liney + 15 && finaly > liney - 15){
                directionsLabel.text = "Congratulations! You are moving onto the next level \nClick to try again"
                updateLevel = true
                levelLabel.text = "Level: " + String(level+1)
            }
            else{
                directionsLabel.text = "You did not stop the ball close enough to the line. \nClick to try again"
            }
        }
        else if(count % 2 == 1){
            directionsLabel.text = ""
            bally += speed + level
            if(bally > Int(self.bounds.maxY)){
                count = 2
            }
        }
        
        
        setNeedsDisplay()  //calls draw function (like a flag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        for t in touches {
            let point = t.location(in: self)
            count += 1
            finaly = bally
            random = Int.random(in: Int(self.bounds.minY) + 70 ... Int(self.bounds.maxY) - 70)
//            shapex = Int(point.x)
//            shapey = Int(point.y)
            
        }
        
        
        
    }
    
}
