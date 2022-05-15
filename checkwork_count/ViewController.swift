//
//  ViewController.swift
//  checkwork_count
//
//  Created by JotaroSugiyama on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    var birdCount: Int = 0
    
    @IBOutlet var label: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var answerButton: UIButton!
    @IBOutlet var birdView: UIView!
    @IBOutlet var seikaiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBird()
        seikaiImageView.isHidden = true
        answerLabel.isHidden = true
        answerButton.setTitle("決定", for: .normal)
    }
    
    func setBird(){
        birdCount = Int.random(in: 2 ... 10)
        for i in 1...birdCount{
            var imageView = UIImageView(image: UIImage(named: "bird"))
            imageView.frame = CGRect(
                x: CGFloat(Int(birdView.bounds.size.width) * Int.random(in: 10 ... 90) / 100),
                y: CGFloat(Int(birdView.bounds.size.width) * Int.random(in: 10 ... 90) / 100),
                width: 50,
                height: 50)
            birdView.addSubview(imageView)
        }
        print("鳥の数：\(birdCount)")
    }
    
    @IBAction func plus(){
        number = number + 1
        update()
    }
    
    @IBAction func minus(){
        number = number - 1
        update()
    }
    
    @IBAction func answer(){
        if answerButton.titleLabel?.text == "決定"{
            seikaiImageView.isHidden = false
            if number == birdCount{
                seikaiImageView.image = UIImage(named: "maru")
                print("正解　ユーザー：\(number)　鳥の数：\(birdCount)")
            }else{
                seikaiImageView.image = UIImage(named: "batu")
                answerLabel.isHidden = false
                answerLabel.text = "正解：\(birdCount)"
                print("不正解　ユーザー：\(number)　鳥の数：\(birdCount)")
            }
            answerButton.setTitle("やり直す", for: .normal)
        }else if answerButton.titleLabel?.text == "やり直す"{
            seikaiImageView.isHidden = true
            answerLabel.isHidden = true
            var subviews = birdView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
            setBird()
            number = 0
            update()
            
            answerButton.setTitle("決定", for: .normal)
        }
        
    }
    
    func update(){
        label.text = String(number)
    }
    
    
}

