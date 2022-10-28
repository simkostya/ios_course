//
//  ViewController.swift
//  Arrays
//
//  Created by Костя Симончик on 28.10.22.
//

/*
 Написать функцию, которая на вход принимает масив картежей типа (Int, String), возводит Int в квадрат, фильтрует только четные Int и упорядочивает по строкам по возрастанию
 */

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myArr = [(2, "Kostya"), (3, "Evialina"), (4, "Den"), (5, "Anya"), (6, "Margarita"), (7, "Frank"), (8, "Elizavetta"), (9, "Andrey"), (10, "Jo")]
        print(mySortedArray(myArray: myArr))
    }
    
    func mySortedArray(myArray: [(Int, String)]) -> [(Int, String)] {
        let result : [(Int, String)] = myArray.map { ($0.0 * $0.0, $0.1) }
            .filter { $0.0 % 2 == 0 }
            .sorted { $0.1.count < $1.1.count }
        return result
    }
}
