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
    @IBOutlet weak var A: UIImageView!
    @IBOutlet weak var B: UIImageView!
    @IBOutlet weak var game: UITextField!
    @IBOutlet weak var peopleA: UIImageView!
    @IBOutlet weak var peopleB: UIImageView!
    var temp = ""
    var mark:String = ""
    var start:String = ""
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
            A.textAlignment = .center
            xa=xa+1;
            if xa>=21{
                let xaa >= xa-2
                if xaa >=xb{
                    X.text="win"
                    Y.text="defeat"
                    Bleft.text=""
                    Bright.text=""
                    Aleft.text=""
                    Aright.text=""
                    game.text="Game Over"
                    
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

