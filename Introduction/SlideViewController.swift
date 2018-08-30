//
//  SlideViewController.swift
//  Introduction
//
//  Created by 미디어스틴트 on 2018. 8. 29..
//  Copyright © 2018년 미디어스틴트. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var SlideImage: UIImageView!
    @IBOutlet var SlideText: UITextView!
    var PageNum = 0
    let text = ["Hello~!","조수환\n趙秀煥","from 서울 북동","Developer","현실은...","성취감!","영적인 성장","협력","커뮤니티의 성장","잘 부탁해요!"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setImage(PageNumber: PageNum)
        setText(PageNumber: PageNum)
    }
    
    private func setImage(PageNumber num:Int){
        let newImage = UIImage(named: "page\(num).jpg")
        self.SlideImage.image = newImage
    }
    
    private func setText(PageNumber num:Int){
        self.SlideText.text = self.text[num]
    }
    
    func setSlide(PageNumber num:Int){
        PageNum = num
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
