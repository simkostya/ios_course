//
//  ViewController.swift
//  Classes
//
//  Created by Костя Симончик on 29.10.22.
//

import iCarousel
import UIKit

class ViewController: UIViewController, iCarouselDataSource {
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
//        view.type = .invertedTimeMachine
        view.type = .rotary

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        
//        myCarousel.autoscroll = -0.2
        myCarousel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.frame.size.width,
                                  height: 400)
    }

    @objc(numberOfItemsInCarousel:) func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
    
    @objc(carousel:viewForItemAtIndex:reusingView:) func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pic\(index+1)")
        return view
    }
    
}

