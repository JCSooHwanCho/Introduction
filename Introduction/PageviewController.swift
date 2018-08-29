//
//  PageviewController.swift
//  Introduction
//
//  Created by 미디어스틴트 on 2018. 8. 29..
//  Copyright © 2018년 미디어스틴트. All rights reserved.
//

import Foundation
import UIKit


class PageviewController:UIPageViewController{
    let NofPages = 10
    private(set) lazy var Slides:[SlideViewController]={
        var Slides:[SlideViewController] = []
        for _ in 0..<NofPages
        {
            Slides.append(self.newSlideViewController())
        }
        return Slides
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = Slides.first{
            setViewControllers([firstViewController], direction: .forward, animated: true){(_) in
                firstViewController.setSlide(PageNumber:1)
            }
        }
    }
    
    private func newSlideViewController()->SlideViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SlideViewController") as! SlideViewController
    }
}


extension PageviewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = Slides.lastIndex(of: viewController as! (SlideViewController)) else{
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            let Slide = Slides.last!;
            
            if(Slide.PageNum != NofPages-1){
                Slide.setSlide(PageNumber: NofPages-1)
            }
            
            return Slide
        }
        guard Slides.count > previousIndex else {
            return nil
        }
        
        let Slide = Slides[previousIndex];
        
        if(Slide.PageNum != previousIndex){
            Slide.setSlide(PageNumber: previousIndex)
        }
        
        return Slide
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = Slides.lastIndex(of: viewController as! (SlideViewController)) else{
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            
            guard nextIndex != Slides.count else {
                return nil
            }
            guard Slides.count > nextIndex else {
                let Slide = Slides.first!
                
                if(Slide.PageNum != 0){
                    Slide.setSlide(PageNumber: 0)
                }
                
                return Slide
            }
            
            let Slide = Slides[nextIndex];
            
            if(Slide.PageNum != nextIndex){
                Slide.setSlide(PageNumber: nextIndex)
            }
            
            return Slide
    }
    
    
}
