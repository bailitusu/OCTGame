//
//  FightMap.swift
//  OctGame
//
//  Created by zc on 16/7/1.
//  Copyright © 2016年 oct. All rights reserved.
//

import UIKit
import SpriteKit

class FightMap: NSObject{
    var oneSpriteRect: FTMapCell!
    var mapArray: NSMutableArray!
    override init() {
        super.init()
        mapArray = NSMutableArray()
    }
    func initFirstSpriteRect(horizontalNum: Int, size: CGSize,originalPointY: CGFloat) {
        oneSpriteRect = FTMapCell(imageName: "fangkuai.png", size: size)
        oneSpriteRect.position = CGPoint(x: (screenSize.width-oneSpriteRect.size.width * CGFloat(horizontalNum))/2+oneSpriteRect.size.width/2, y: originalPointY)
        
       // return oneSpriteRect
    }

    func createOneSpriteRect(size: CGSize) -> SKSpriteNode {
        let one = FTMapCell(imageName: "fangkuai.png", size: size)
        one.size = size
        return one
    }
    
    func getCurrentPointMapCell(currentPoint: CGPoint)->Int? {
        
        for i in 0 ..< mapArray.count {
            if CGRectContainsPoint((mapArray[i] as! FTMapCell).frame, currentPoint) {
                return i
            }
        }
        return nil
    }
    
    func initMap(horizontalNum: Int, verticalNum: Int, oneSize: CGSize, originalPointY: CGFloat,isEnemy: Bool) {
        self.initFirstSpriteRect(horizontalNum, size: oneSize, originalPointY: originalPointY)
        for i in 0 ..< horizontalNum {
            for j in 0 ..< verticalNum {
                let newSpriteRect = self.createOneSpriteRect(oneSize)
                if isEnemy == true {
                    newSpriteRect.position = CGPoint(x: screenSize.width-oneSpriteRect.position.x-CGFloat(i)*oneSize.width, y: oneSpriteRect.position.y+CGFloat(j)*oneSize.height)
                }else {
                    newSpriteRect.position = CGPoint(x: oneSpriteRect.position.x+CGFloat(i)*oneSize.width, y: oneSpriteRect.position.y-CGFloat(j)*oneSize.height)
                }
                newSpriteRect.zPosition = SpriteLevel.map.rawValue
              //  scene.addChild(newSpriteRect)
                mapArray.addObject(newSpriteRect)
            }
        }
    }
    
    
//    static func reversalPoint(point: CGPoint) -> CGPoint {
//        return CGPoint(x: point.x, y: screenSize.height-point.y)
//    }
//    func  getOneRectCenter(currentRect: CGRect!) {
//        let centerPoint = CGPoint(x: currentRect.origin.x+currentRect.size.width/2, y: 0)
//    }
}
