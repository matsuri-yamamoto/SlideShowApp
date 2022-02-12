//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山本梨野 on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    //一定の間隔で処理を行う
    var timer: Timer!
    
    // 画像の名前の配列
    let imageArray = ["0","1","2"]
    
    //最初は1番目の画像
    var displayImageNo = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //画像の名前としてdisplayImageNoを参照する
        let name = imageArray[displayImageNo]
        imageView.image = UIImage(named: name)
    }

    
    //    nextボタンを押すと、次の画像に切り替わる
    @IBAction func nextButton(_ sender: Any) {
        if displayImageNo == 2 {
            displayImageNo = 0
        }else if displayImageNo != 2 {
            displayImageNo = displayImageNo+1
        }
        
        //画像の名前としてdisplayImageNoを参照する
        let name = imageArray[displayImageNo]
        imageView.image = UIImage(named: name)

    }
    

    //    prevボタンを押すと、前の画像に切り替わる
    @IBAction func prevButton(_ sender: Any) {
        if displayImageNo == 0 {
            displayImageNo = 2
        }else if displayImageNo != 0{
            displayImageNo = displayImageNo-1
        }
        
        let name = imageArray[displayImageNo]
        imageView.image = UIImage(named: name)
        
    }
    
    //画像を切り替える、というタイマーの行う処理
    @objc func updateTimer(_ timer: Timer) {
        if displayImageNo != 2 {
            displayImageNo += 1
        } else if displayImageNo == 2 {
            displayImageNo = 0
        }
        
        let name = imageArray[displayImageNo]
        imageView.image = UIImage(named: name)
    }
    
    //    スタートを押すと2秒ごとに切り替わるタイマーが呼ばれ、それに伴いupdateTimerが呼ばれる
    //    タイマーが複数呼ばれて早くなることを防ぐため、timer = nilでない場合は呼ばれないようにする
    //    また、スタートボタンがストップボタンに表示が変わる
    //    nextボタンとprevボタンは押せなくなる
    
    @IBAction func startButton(_ sender: Any) {
        if timer != nil{
            timer.invalidate()
            timer = nil
            (sender as AnyObject).setTitle("start", for: .normal)
        }else {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            (sender as AnyObject).setTitle("stop", for: .normal)
        }
    }
    
    //データを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let nextViewController:NextViewController = segue.destination as! NextViewController
        nextViewController.wideImageNo = displayImageNo
        print(displayImageNo)
        
    }
    

    //画像をタップしたら、画像のデータを渡して画面遷移する
    @IBAction func imageTap(_ sender: Any) {
                
        //画面遷移(作成したセグエを指定する)
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    //戻るボタンが押されたら呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
      }
    
//    ストップボタンを押下するとタイマーが止まり、画像もその時点で表示されているもので停止する
//    nextボタンとprevボタンは押せるようになる
    



    

}

