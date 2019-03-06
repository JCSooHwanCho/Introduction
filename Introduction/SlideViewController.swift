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
    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.portrait,.landscape,.portraitUpsideDown]
    }
    
    var PageNum = 0
    var TotalPageCount = 10
    var text:([String])?
   //called at every viewLoad, So must set Image and text here.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        text = loadTextFromJSON()
        if text == nil{
            exit(0)
        }
        self.setImage()
        self.setText()
        self.setPageControl()
        pageControl.isHidden = true
        
        SlideImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setImage(){
        let newImage = UIImage(named: "page\(PageNum).JPG")
        self.SlideImage.image = newImage
    }
    
    private func setText(){
        self.SlideText.text = self.text![PageNum]
    }
    private func setPageControl(){
        pageControl.numberOfPages = TotalPageCount
        pageControl.currentPage = PageNum
    }
    
    func setSlide(TotalPageCount total:Int, PageNumber num:Int){
        TotalPageCount = total
        PageNum = num
    }
    private func loadTextFromJSON()->[String]?{
        let decoder = JSONDecoder();
        let path = Bundle.main.path(forResource: "text", ofType: "json")
        if let data = try? String(contentsOfFile: path!).data(using: .utf8){
            do{
                let text = try decoder.decode([String].self, from: data!)
                return text
            }
            catch{
                print(error)
            }
    }
        return nil
    }
}
