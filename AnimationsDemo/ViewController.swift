//
//  ViewController.swift
//  AnimationsDemo
//
//  Created by Trista on 2021/2/12.
//

import UIKit

class ViewController: UIViewController {

    //建立十二個屬性與設置預設值，以供後續使用
    //取得螢幕的尺寸
    var fullSize = UIScreen.main.bounds.size
    var myLabel: UILabel!
    
    //每個動畫都設置四個循環變動的值
    let arrBounds = [
        CGSize(width: 100, height: 100),
        CGSize(width: 50, height: 50),
        CGSize(width: 150, height: 150),
        CGSize(width: 50, height: 50)]
    
    //要變換位置的 center ，就是一個型別為[CGPoint]的陣列，其內依序放置四個位置(CGPoint)
    var arrCenter :[CGPoint]!
    
    let arrAlpha = [0.25, 0.75, 0.5, 1.0]
    
    let arrBackgroundColor = [
        UIColor.cyan, UIColor.green,
        UIColor.orange, UIColor.black]
    
    let arrTransform =
        [CGAffineTransform(rotationAngle: CGFloat(.pi * 0.25)),
         CGAffineTransform(rotationAngle: CGFloat(.pi * 1.25)),
         CGAffineTransform(rotationAngle: CGFloat(.pi * 1.75)),
         CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))]
    
    var indexBounds = 0
    var indexCenter = 0
    var indexAlpha = 0
    var indexBackgroundColor = 0
    var indexTransform = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        //要變換位置的 center ，就是一個型別為[CGPoint]的陣列，其內依序放置四個位置(CGPoint)
        arrCenter = [
            CGPoint(x: fullSize.width * 0.75,
                    y: fullSize.width * 0.25),
            CGPoint(x: fullSize.width * 0.75,
                    y: fullSize.width * 0.75),
            CGPoint(x: fullSize.width * 0.25,
                    y: fullSize.width * 0.75),
            CGPoint(x: fullSize.width * 0.25,
                    y: fullSize.width * 0.25)]

        //建立 UIButton 與 UILabel
        self.createButtonsAndLabel()
        
    }
    
    
    func createButtonsAndLabel() {
            
        //建立一個 UILabel
        myLabel = UILabel(frame: CGRect(
                            x: 0, y: 0,
                            width: 50, height: 50))
        myLabel.text = "Swift"
        myLabel.backgroundColor = UIColor.black
        myLabel.textColor = UIColor.white
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(
            x: fullSize.width * 0.25, y: fullSize.width * 0.25)
        self.view.addSubview(myLabel)
            
            
        //建立六個 UIButton
        //bounds可以改變視圖的尺寸
        let btnHeight = CGFloat(80.0)
        var btn = UIButton(frame: CGRect(
                            x: 0, y: 0,
                            width: fullSize.width * 0.5,
                            height: btnHeight))
        btn.setTitle("bounds", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        //按下 bounds 按鈕後執行動作的方法
        btn.addTarget(nil,
                      action:#selector(ViewController.AnimateBounds),
                      for: .touchUpInside)
        btn.center = CGPoint(
            x: fullSize.width * 0.25,
            y: fullSize.height - 4.5 * btnHeight)
        self.view.addSubview(btn)
        
        
        //alpha可以改變視圖的透明度
        btn = UIButton(frame: CGRect(
                        x: 0, y: 0,
                        width: fullSize.width * 0.5,
                        height: btnHeight))
        btn.setTitle("alpha", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        //按下 alpha 按鈕後執行動作的方法
        btn.addTarget(nil,
                      action: #selector(ViewController.AnimateAlpha),
                      for: .touchUpInside)
        btn.center = CGPoint(
            x: fullSize.width * 0.75,
            y: fullSize.height - 4.5 * btnHeight)
        self.view.addSubview(btn)

        
        //backgroundColor可以改變視圖的背景顏色
        btn = UIButton(frame: CGRect(
                        x: 0, y: 0,
                        width: fullSize.width * 0.5,
                        height: btnHeight))
        btn.setTitle("backgroundColor", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        //按下 backgroundColor 按鈕後執行動作的方法
        btn.addTarget(nil,action:
                        #selector(ViewController.AnimateBackgroundColor),
                      for: .touchUpInside)
        btn.center = CGPoint(
            x: fullSize.width * 0.25,
            y: fullSize.height - 3.5 * btnHeight)
        self.view.addSubview(btn)
        
        
        //center可以改變視圖的位置
        btn = UIButton(frame: CGRect(
                        x: 0, y: 0,
                        width: fullSize.width * 0.5,
                        height:btnHeight))
        btn.setTitle("center", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        //按下 center 按鈕後執行動作的方法
        btn.addTarget(nil,
                      action:#selector(ViewController.AnimateCenter),
                      for: .touchUpInside)
        btn.center = CGPoint(
            x: fullSize.width * 0.75,
            y: fullSize.height - 3.5 * btnHeight)
        self.view.addSubview(btn)
            
           
        //transform可以平移、縮放或旋轉視圖
        btn = UIButton(frame: CGRect(
                        x: 0, y: 0,
                        width: fullSize.width * 0.5,
                        height: btnHeight))
        btn.setTitle("transform", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        //旋轉視圖，按下 transform 按鈕後執行動作的方法
        btn.addTarget(nil,
                      action:#selector(ViewController.AnimateTransform),
                      for: .touchUpInside)
        btn.center = CGPoint(
            x: fullSize.width * 0.25,
            y: fullSize.height - 2.5 * btnHeight)
        self.view.addSubview(btn)
        
        
        //一次執行所有的動畫
        btn = UIButton(frame: CGRect(
                        x: 0, y: 0,
                        width: fullSize.width * 0.5,
                        height: btnHeight))
        btn.setTitle("all", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        //按下all按鈕後執行動作的方法
        btn.addTarget(nil,
                      action: #selector(ViewController.AnimateAll),
                      for: .touchUpInside)
        btn.center = CGPoint(
            x: fullSize.width * 0.75,
            y: fullSize.height - 2.5 * btnHeight)
        self.view.addSubview(btn)
        
    }
    
    
    //bounds可以改變視圖的尺寸,按下bounds按鈕後執行動作的方法
    @objc func AnimateBounds() {
        //要變化成為的尺寸newSize
        let newSize = self.arrBounds[self.indexBounds]

        //目前的位置originCenter
        let originCenter = self.myLabel.center
        
        //第一個參數withDuration為整個動畫執行的時間，單位為秒
        //第二個參數是一個閉包(closure)，放置要達成的動畫結果--將尺寸self.myLabel.bounds設置為前面取得的newSize，動畫的過程會將視圖在執行時間內，漸進地變大(或變小)尺寸。
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.myLabel.bounds = CGRect(
                    x: 0, y: 0,
                    width: newSize.width,
                    height: newSize.height)
            //因為改變尺寸是以原點為準，所以 center 會變，再把 center 設置為原本的值originCenter
            self.myLabel.center = originCenter
        })
        //讓值可以循環使用
        self.updateIndex("bounds")
    }

    
    //alpha可以改變視圖的透明度，按下alpha按鈕後執行動作的方法
    @objc func AnimateAlpha() {
        //第一個參數withDuration為整個動畫執行的時間，單位為秒
        //第二個參數是一個閉包(closure)，放置要達成的動畫結果
        //第三個參數是一個閉包(closure)，在動畫完成後執行，可以再接續下一個動畫，或是其他整理清除的動作
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.myLabel.alpha = CGFloat(self.arrAlpha[self.indexAlpha])
        },
            completion: { _ in
            print("Animation Alpha Complete")
        })
        //讓值可以循環使用
        self.updateIndex("alpha")
    }
    
    
    //backgroundColor可以改變視圖的背景顏色，按下backgroundColor 按鈕後執行動作的方法
    @objc func AnimateBackgroundColor() {
        //第一個參數withDuration為整個動畫執行的時間，單位為秒
        //第二個參數delay是設置為要延遲開始的時間，單位為秒，當有多個動畫要一起執行時，如果想要有不同時間開始執行的效果可以設置
        //第三個參數options可以設置如何執行動畫的方式(依據改變的視圖屬性不同，可能有些會沒有效果)
        //第四個參數是一個閉包(closure)，放置要達成的動畫結果
        //第五個參數是一個閉包(closure)，在動畫完成後執行，可以再接續下一個動畫，或是其他整理清除的動作
        UIView.animate(
            withDuration: 1,
            delay: 0.2,
            options: .curveEaseIn,
            animations: {
            self.myLabel.backgroundColor =
            self.arrBackgroundColor[self.indexBackgroundColor]
          },
            completion: { _ in
            print("Animation BackgroundColor Complete")
        })
        //讓值可以循環使用
        self.updateIndex("backgroundColor")
    }
    
    
    //center可以改變視圖的位置，按下center按鈕後執行動作的方法
    @objc func AnimateCenter() {
        //第一個參數withDuration為整個動畫執行的時間，單位為秒
        //第二個參數delay是設置為要延遲開始的時間，單位為秒，當有多個動畫要一起執行時，如果想要有不同時間開始執行的效果可以設置
        //第三個參數usingSpringWithDamping是設置視圖的回彈量，可設置0~1，越接近 1 則彈越少下
        //第四個參數initialSpringVelocity是設置初始速度，數字越大則會越快，要平滑變化的話可以設置為0
        //第五個參數options可以設置如何執行動畫的方式(依據改變的視圖屬性不同，可能有些會沒有效果)
        //第六個參數是一個閉包(closure)，放置要達成的動畫結果
        //第七個參數是一個閉包(closure)，在動畫完成後執行，可以再接續下一個動畫，或是其他整理清除的動作
        UIView.animate(
            withDuration: 1.5,
            delay: 0.1,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: {
                self.myLabel.center = self.arrCenter[self.indexCenter]
          },
            completion: { _ in
            print("Animation Center Complete")
          })
        //讓值可以循環使用
        self.updateIndex("center")
    }
    
    
    //transform可以平移、縮放或旋轉視圖，此例是旋轉視圖，按下transform按鈕後執行動作的方法
    @objc func AnimateTransform() {
        //第一個參數withDuration為整個動畫執行的時間，單位為秒
        //第二個參數是一個閉包(closure)，放置要達成的動畫結果
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.myLabel.transform = self.arrTransform[self.indexTransform]
        })
        //讓值可以循環使用
        self.updateIndex("transform")
    }
    
    
    //一次執行所有的動畫，按下all按鈕後執行動作的方法
    @objc func AnimateAll() {
        //要變化成為的尺寸newSize
        let newSize = self.arrBounds[self.indexBounds]
        //第一個參數withDuration為整個動畫執行的時間，單位為秒
        //第二個參數是一個閉包(closure)，放置要達成的動畫結果
        UIView.animate(
            withDuration: 0.5,
            animations: {
            //bounds可以改變視圖的尺寸
            self.myLabel.bounds = CGRect(
                x: 0, y: 0,
                width: newSize.width,
                height: newSize.height)
                
            //alpha可以改變視圖的透明度
            self.myLabel.alpha = CGFloat(self.arrAlpha[self.indexAlpha])
                
            //backgroundColor可以改變視圖的背景顏色
            self.myLabel.backgroundColor = self.arrBackgroundColor[self.indexBackgroundColor]
                
            //center可以改變視圖的位置
            self.myLabel.center = self.arrCenter[self.indexCenter]
                
            //transform可以平移、縮放或旋轉視圖,此例是旋轉視圖
            self.myLabel.transform = self.arrTransform[self.indexTransform]
            })
        //讓值可以循環使用
        self.updateIndex("all")
        
    }
    
    
    func updateIndex(_ type: String) {
        if type == "bounds" {
            self.indexBounds = self.indexBounds >= 3 ? 0 :
                self.indexBounds + 1
        }
        else if type == "alpha" {
            self.indexAlpha = self.indexAlpha >= 3 ? 0 : self.indexAlpha + 1
        }
        else if type == "backgroundColor" {
            self.indexBackgroundColor = self.indexBackgroundColor >= 3 ? 0 : self.indexBackgroundColor + 1
        }
        else if type == "center" {
            self.indexCenter = self.indexCenter >= 3 ? 0 : self.indexCenter + 1
        }
        else if type == "transform" {
            self.indexTransform = self.indexTransform >= 3 ? 0 : self.indexTransform + 1
        }
        else if type == "all" {
            self.indexBounds = self.indexBounds >= 3 ? 0 :
                self.indexBounds + 1
                
            self.indexAlpha = self.indexAlpha >= 3 ? 0 : self.indexAlpha + 1
            
            self.indexBackgroundColor = self.indexBackgroundColor >= 3 ? 0 : self.indexBackgroundColor + 1
            
            self.indexCenter = self.indexCenter >= 3 ? 0 : self.indexCenter + 1
                
            self.indexTransform = self.indexTransform >= 3 ? 0 :
                    self.indexTransform + 1
            }
        }
}

