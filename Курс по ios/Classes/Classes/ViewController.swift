//
//  ViewController.swift
//  Classes
//
//  Created by Костя Симончик on 30.10.22.
//

/*
 Пивбар. Класс Beer, свойства: имя, цена, страна, остаток объема. Реализовать продажу пива через менеджер-синглтон. Проверка выручки в конце дня, начало новой смены - обнуление выручки, проверка остатков. Графический интерфейс - самостоятельно
 */

import UIKit
class ViewController: UIViewController {
    
    lazy var picture: UIImageView = {
        var pic = UIImageView()
        pic.frame = CGRect(x: view.layer.frame.width / 2 - 100, y: view.layer.frame.height / 6, width: 200, height: 200)
        pic.image = UIImage(named: "image1")
        return pic
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mySegmentedControl = UISegmentedControl(items: ["Coca","Sprite","Fanta","Pepsi"])
        let xPostion:CGFloat = 20
        let yPostion:CGFloat = view.layer.frame.width / 5
        let elementWidth:CGFloat = view.layer.frame.width - 40
        let elementHeight:CGFloat = 35
        
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        
        mySegmentedControl.selectedSegmentIndex = 0
        mySegmentedControl.selectedSegmentTintColor = UIColor.systemYellow
        mySegmentedControl.backgroundColor = UIColor.systemGray6

    
        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(picture)
        self.view.addSubview(mySegmentedControl)

    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        if sender.selectedSegmentIndex == 0 {
            picture.image = UIImage(named: "image1")
        }
        if sender.selectedSegmentIndex == 1 {
            picture.image = UIImage(named: "image2")
        }
        if sender.selectedSegmentIndex == 2 {
            picture.image = UIImage(named: "image3")
        }
        if sender.selectedSegmentIndex == 3 {
            picture.image = UIImage(named: "image4")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

