//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 山本梨野 on 2022/02/09.
//

import UIKit

class NextViewController: UIViewController {
        
    @IBOutlet weak var imageView: UIImageView!
    
    //画像の名前を指定するために受け取るための変数
     var wideImageNo = 0
    
    // 画像の名前の配列
    let imageArray = ["0","1","2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //画像の名前としてdisplayImageNoを参照する
        let resultNo = imageArray[wideImageNo]
        imageView.image = UIImage(named: resultNo)
        
        print(resultNo)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
