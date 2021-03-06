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
    
    
    @IBOutlet weak var peopleB: UIImageView!
    @IBOutlet weak var peopleA: UIImageView!
    @IBOutlet weak var x: UITextField!
    @IBOutlet weak var y: UITextField!
    @IBOutlet weak var vs: UITextField!
    @IBOutlet weak var start: UITextField!
    @IBOutlet weak var game: UITextField!
    @IBOutlet weak var Aleft: UITextField!
    @IBOutlet weak var Aright: UITextField!
    @IBOutlet weak var Bleft: UITextField!
    @IBOutlet weak var Bright: UITextField!
    @IBOutlet weak var Aall: UITextField!
    @IBOutlet weak var Ball: UITextField!
    
    var xa:Int = 0
    var xb:Int = 0
    var xaa:Int = 0
    var xbb:Int = 0
    var dlg=0
    var flagA=0
    var flagB=0
    var del=0
    var aa = 0
    var bb = 0
 


    @IBAction func A(_ sender: Any) {
        if dlg==0{
            flagA=1
            flagB=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)//初始化图片控制器
            {
                let picker = UIImagePickerController()//设置代理
                picker.delegate = self  //设定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary  //弹出控制器，显示界面
                self.present(picker, animated: true, completion: {() ->Void in})
            }else{
                print("读取相册错误")
            }
        }
    }
    @IBAction func B(_ sender: Any) {
        if dlg==0{
            flagA=0
            flagB=1
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)//初始化图片控制器
            {
                let picker = UIImagePickerController()//设置代理
                picker.delegate = self  //设定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary  //弹出控制器，显示界面
                self.present(picker, animated: true, completion: {() ->Void in})
            }else{
                print("读取相册错误")
            }
        }

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)//显示的照片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as!UIImage
        if(flagA==1){
            peopleA.image = image
        }else if(flagB==1){
            peopleB.image = image
        }//
        picker.dismiss(animated: true, completion: {() ->Void in})
    }
    
    
    
 
    
    @IBAction func markA(_ sender: Any) {
        if dlg==1{
            del=1
            if game.text != "Game Over"{
                x.textAlignment = .center
                xa=xa+1
                if xa>=21{
                    let xaa=xa-2
                    if xaa >= xb{
                        x.text="胜利"
                        y.text="失败"
                        aa = aa + 1
                        Aall.text = "\(aa)"
                        xa = 0
                        xb = 0
                        Bleft.text=""
                        Bright.text=""
                        Aleft.text=""
                        Aright.text=""
                        if aa == 2{
                            game.text="Game Over"
                            xa = 0
                            x.text = ""
                            xb = 0
                            y.text = ""
                            
                            
                        }
                        
                        
                    }
                    else{
                        if xa>xb{
                            if xa==30{
                                x.text="胜利"
                                y.text="失败"
                                aa = aa + 1
                                Aall.text = "\(aa)"
                                Bleft.text=""
                                Bright.text=""
                                Aleft.text=""
                                Aright.text=""
                                if aa == 2{
                                    game.text="Game Over"
                                    xa = 0
                                    x.text = ""
                                    xb = 0
                                    y.text = ""
                                    aa = 0
                                    bb = 0
                                    
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
    }
    @IBAction func markB(_ sender: Any) {
        if dlg==1{
            del=2
            if game.text != "Game Over"{
                y.textAlignment = .center
                xb=xb+1
                if xb>=21{
                    let xbb=xb-2
                    if xbb >= xa{
                        y.text="胜利"
                        x.text="失败"
                        bb = bb + 1
                        Ball.text = "\(bb)"
                        xa = 0
                        xb = 0
                        Bleft.text=""
                        Bright.text=""
                        Aleft.text=""
                        Aright.text=""
                        if bb == 2{
                            game.text="Game Over"
                            xb = 0
                            x.text = ""
                            xb = 0
                            y.text = ""
                        }
                    }
                    else{
                        if xb>xa{
                            if xb==30{
                                y.text="胜利"
                                x.text="失败"
                                bb = bb + 1
                                Ball.text = "\(bb)"
                                Bleft.text=""
                                Bright.text=""
                                Aleft.text=""
                                Aright.text=""
                                if bb == 2{
                                    game.text="Game Over"
                                    xb = 0
                                    x.text = ""
                                    xb = 0
                                    y.text = ""
                                    aa = 0
                                    bb = 0
                                }
                            }
                            else{
                                y.text="\(xb)"
                                if xb%2 != 0{
                                    Aleft.text=""
                                    Aright.text=""
                                    Bleft.text="\("发球")"
                                    Bright.text=""
                                }
                                else{
                                    Aleft.text=""
                                    Aright.text=""
                                    Bleft.text=""
                                    Bright.text="\("发球")"
                                }
                            }
                        }
                        else{
                            y.text="\(xb)"
                            if xb%2 != 0{
                                Aleft.text=""
                                Aright.text=""
                                Bleft.text="\("发球")"
                                Bright.text=""
                            }
                            else{
                                Aleft.text=""
                                Aright.text=""
                                Bleft.text=""
                                Bright.text="\("发球")"
                            }
                        }
                    }
                }
                else {
                    y.text="\(xb)"
                    if xb%2 != 0{
                        Aleft.text=""
                        Aright.text=""
                        Bleft.text="\("发球")"
                        Bright.text=""
                    }
                    else{
                        Aleft.text=""
                        Aright.text=""
                        Bleft.text=""
                        Bright.text="\("发球")"
                    }
                }
            }
        }
        
    }
    @IBAction func start(_ sender: Any) {
        if peopleA.image != nil && peopleB.image != nil {
            if dlg==0{
                dlg=1
                if xa==0{
                    if xb==0{
                        x.textAlignment = .center
                        y.textAlignment = .center
                        vs.textAlignment = .center
                        vs.textAlignment = .center
                        Bleft.textAlignment = .center
                        Bright.textAlignment = .center
                        Aleft.textAlignment = .center
                        Aright.textAlignment = .center
                        game.textAlignment = .center
                        vs.text = ":"
                        x.text = "0"
                        y.text = "0"
                        vs.text = "VS"
                        game.text = ""
                        let temp = Int(arc4random()%100)+1
                        if temp%2==0{
                            Bright.text="\("发球")"
                        }
                        else{
                            Aright.text="\("发球")"
                        }
                        
                    }
                }
            }
        }
        else{
            if peopleA.image == nil && peopleB.image != nil {
                let alertController = UIAlertController(title:"系统提示",
                                                        message:"请先上传选手A照片：\n",
                                                        preferredStyle:. alert)
                
                
                //显示显示框
                self.present(alertController,animated: true,completion: nil)
                let okAction = UIAlertAction(title: "",style: .default,handler:{
                    action in
                    print("")
                })
                alertController.addAction(okAction)
                //5秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 5) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
            }
            
        }
    }
    @IBAction func delate(_ sender: Any) {
        if dlg==1{
            if game.text==""{
                if del==1{
                    if xa>=1{
                        xa=xa-1
                        x.text="\(xa)"
                        del=0
                    }
                }
                else if del==2{
                    if xb>=1{
                        xb=xb-1
                        y.text="\(xb)"
                        del=0
                    }
                }
            }
        }

    }

    @IBAction func finish(_ sender: Any) {
        if dlg==1{
            if game.text=="Game Over"{
                x.text=""
                y.text=""
                vs.text = ""
                vs.text = ""
                dlg=0
                Bleft.text=""
                Bright.text=""
                Aleft.text=""
                Aright.text=""
                game.text=""
                peopleA.image=nil
                peopleB.image=nil
                xa=0
                xb=0
                flagA=0
                flagB=0
                
            }
        }
    }
}
    
    
    




