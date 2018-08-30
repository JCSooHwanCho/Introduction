//
//  PageviewController.swift
//  Introduction
//
//  Created by SoohwanCho on 2018. 8. 29..
//  Copyright © 2018년 SoohwanCho. All rights reserved.
//

import Foundation
import UIKit


class PageviewController:UIPageViewController{
    let NofPages = 10
    private lazy var Slides:[SlideViewController]={
        var S:[SlideViewController] = []
        for i in 0..<NofPages
        {
            var Slide = self.newSlideViewController()
            Slide.setSlide(PageNumber: i)
            S.append(Slide)
        }
        return S
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = Slides.first{
            setViewControllers([firstViewController], direction: .forward, animated: true)
        }
    }
    
    private func newSlideViewController()->SlideViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SlideViewController") as! SlideViewController
    }
}


extension PageviewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let Slide = viewController as! SlideViewController
        guard let viewControllerIndex = Slides.index(of:Slide) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard Slides.count > previousIndex else {
            return nil
        }
        
        let S = Slides[previousIndex]
        return S
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let Slide = viewController as! SlideViewController
        guard let viewControllerIndex = Slides.index(of:Slide) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let SlideCount = Slides.count
        
        guard SlideCount != nextIndex else {
            return nil
        }
        
        guard SlideCount > nextIndex else {
            return nil
        }
        let S = Slides[nextIndex]
        
        return S
    }
    
    
}
