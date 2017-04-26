//
//  ViewController.swift
//  Badminton match
//
//  Created by s20151104683 on 17/3/27.
//  Copyright © 2017年 s20151104683. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{
    
    
    @IBOutlet weak var x: UITextField!
    @IBOutlet weak var y: UITextField!
    @IBOutlet weak var vs: UITextField!
    @IBOutlet weak var start: UITextField!
    @IBOutlet weak var game: UITextField!
   
    @IBOutlet weak var Aleft: UITextField!
    @IBOutlet weak var Aright: UITextField!
    @IBOutlet weak var Bleft: UITextField!
    @IBOutlet weak var Bright: UITextField!
  
    
    @IBOutlet weak var peopleA: UIImageView!
    @IBOutlet weak var peopleB: UIImageView!
    var xa : Int = 0
    var xb : Int = 0
    var flagA=0
    var flagB=0
    var dlg=0
    var del=0


  
    @IBAction func A(_ sender: Any) {
        if dlg==0{
            flagA=1
            flagB=0
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //弹出控制器，显示界面
                self.present(picker,animated: true,completion:
                {
                    () ->Void in
                })
            }else{
                print("读取相册错误")
            }
        }
    }
        
   
    @IBAction func B(_ sender: Any) {
        if dlg==0{
            flagA=0
            flagB=1
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //弹出控制器，显示界面
                self.present(picker,animated: true,completion:
                    {
                        () ->Void in
                })
            }else{
                print("读取相册错误")
            }
        }

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo
        info:[String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage]as!
            UIImage
        if(flagA==1){
            peopleA.image = image}
        else if(flagB==1){
            peopleB.image = image
        }
        //图片控制器退出
        picker.dismiss(animated: true, completion: {() -> Void in})
        }
    
    @IBAction func markA(_ sender: Any) {
        if dlg==1{
            del=1
            if game.text != "Game Over"{
            x.textAlignment = .center
            xa=xa+1;
            if xa>=21{
                let xaa=xa-2
                if xaa >= xb{
                    x.text="win"
                    y.text="defeat"
                    Bleft.text=""
                    Bright.text=""
                    Aleft.text=""
                    Aright.text=""
                    game.text="Game Over"
                    
                }
                else{
                    x.text="\(xa)"
                    if xa%2 != 0{
                        Aleft.text="\("发球")"
                        Aright.text=" "
                        Bleft.text=" "
                        
                        
                    }else{
                        Aleft.text=""
                        Aright.text="\("发球")"
                        Bleft.text=""
                        
                    }
                }
            }
            else {
                if xa>xb{
                    if xa==30{
                        x.text="win"
                        y.text="defeat"
                        Bleft.text=""
                        Aright.text=""
                        Aright.text=""
                        game.text="Game Over"
                        
                    }else {
                        x.text="\(xa)"
                        if xa%2 != 0{
                            Aleft.text="\("发球")"
                            
                            Aright.text=""
                            Bleft.text=""
                            Bright.text=""
                        }
                        else{
                            Aleft.text=""
                            
                            Aright.text="\("发球")"
                            Bleft.text=""
                            Bright.text=""
                        }
                    }
                }
                else {
                    x.text="\(xa)"
                    if xa%2 != 0{
                        Aleft.text="\("发球")"
                        Aright.text=""
                        Bleft.text=""
                        Bright.text=""
                    }
                    else{
                        Aleft.text=""
                        
                        Aright.text="\("发球")"
                        Bleft.text=""
                        Bright.text=""
                    }
                    
                }
            }
        }
            else{
                x.text="\(xa)"
                if xa%2 != 0{
                    Aleft.text="\("发球")"
                    Aright.text=""
                    Bleft.text=""
                    Bright.text=""
                }
                else{
                    Aleft.text=""
                    
                    Aright.text="\("发球")"
                    Bleft.text=""
                    Bright.text=""
                }

            }
    }
    
}
    @IBAction func markB(_ sender: Any) {
        if dlg==1{
            del=2
            if game.text != "Game Over"{
                y.textAlignment = .center
                xb=xb+1;
                if xb>=21{
                    let xbb=xb-2
                    if xbb >= xa{
                        x.text="win"
                        y.text="defeat"
                        Bleft.text=""
                        Bright.text=""
                        Aleft.text=""
                        Aright.text=""
                        game.text="Game Over"
                        
                    }
          
                else {
                    if xb>xa{
                        if xa==30{
                            x.text="win"
                            y.text="defeat"
                            Bleft.text=""
                            Aright.text=""
                            Aright.text=""
                            game.text="Game Over"
                            
                        }else {
                            x.text="\(xa)"
                            if xa%2 != 0{
                                Aleft.text="\("发球")"
                                
                                Aright.text=""
                                Bleft.text=""
                                Bright.text=""
                            }
                            else{
                                Aleft.text=""
                                
                                Aright.text="\("发球")"
                                Bleft.text=""
                                Bright.text=""
                            }
                        }
                    }
                    else {
                        x.text="\(xa)"
                        if xa%2 != 0{
                            Aleft.text="\("发球")"
                            Aright.text=""
                            Bleft.text=""
                            Bright.text=""
                        }
                        else{
                            Aleft.text=""
                            
                            Aright.text="\("发球")"
                            Bleft.text=""
                            Bright.text=""
                        }
                        
                    }
                }
            }
            else{
                x.text="\(xa)"
                if xa%2 != 0{
                    Aleft.text="\("发球")"
                    Aright.text=""
                    Bleft.text=""
                    Bright.text=""
                }
                else{
                    Aleft.text=""
                    
                    Aright.text="\("发球")"
                    Bleft.text=""
                    Bright.text=""
                }
                
            }
        }

        
    }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

