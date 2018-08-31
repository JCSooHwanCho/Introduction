//
//  SlideViewController.swift
//  Introduction
//
//  Created by SoohwanCho on 2018. 8. 29..
//  Copyright © 2018년 SoohwanCho. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var SlideImage: UIImageView!
    @IBOutlet var SlideText: UITextView!
    var PageNum = 0
    var TotalPageCount = 10
    let text = ["Hello~!","조수환\n趙秀煥","from 서울 북동","Developer","현실은...","성취감!","영적인 성장","협력","커뮤니티의 성장","잘 부탁해요!"]
   //called at every viewLoad, So must set Image and text here.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setImage()
        self.setText()
        self.setPageControl()
    }
    
    private func setImage(){
        let newImage = UIImage(named: "page\(PageNum).jpg")
        self.SlideImage.image = newImage
    }
    
    private func setText(){
        self.SlideText.text = self.text[PageNum]
    }
    private func setPageControl(){
        pageControl.numberOfPages = TotalPageCount
        pageControl.currentPage = PageNum
    }
    
    func setSlide(TotalPageCount total:Int, PageNumber num:Int){
        TotalPageCount = total
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
