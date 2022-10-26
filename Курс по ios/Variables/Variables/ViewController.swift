//
//  ViewController.swift
//  Variables
//
//  Created by Костя Симончик on 26.10.22.
//

/*
 Домашнее задание:
 Основное:
 1) сумма отдельно целых и отдельно дробных частей чисел 2.5, 9.7, 6.9, 8.2
 2) проверка, является ли строка длиннее чем 15 символов
 3) записать формулу a = b * 25 - c(в степение 3) * d / e, где a - переменная Int, b - переменная Double, c - переменная Int, d - переменная Int, e - переменная Double.
 4) создать switch с переменной a: Int. И если a == 1 - Вывести в консоль "Один" и так до 10, так же если а больше 10 но меньше 100 - вывести в консоль "Больше 10 но меньше 100". А если число больше 100 вывести "Число больше ста". Все сделать в одном switch.
 5) Сложить 2 строки a = "15", b = "13.3" и получить в результате с: Double = 18.3

 Дополнительное (может затрагивать темы, которые мы еще не проходили):
 6) Написать и вызвать функцию, которая будет возводить любое число в любую степень. (Не использую встроенные готовые функции) (func powerOfValue(power: Int, value: Int) -> Int)
  Пример вызова: powerOfValue(power: 3, value: 5)
  Результат: 5 возвести в 3 степень, будет 125
 7) Написать и вызвать функцию, которая будет принимать строку и возвращать строку задом наперед (func revertString(string: String) -> String)
  Пример вызова: revertString(string: "Some text for reverse")
  Результат: Перевернуть строку "Some text for reverse" и получится "esrever rof txet emoS"
 8) Написать и вызвать функцию, которая будет удалять пробелы из строки и выводить как camel case (func camelCaseString(string: String) -> String)
  Пример вызова: camelCaseString(string: "Some text for camel case")
  Результат: "SomeTextForCamelCase"
 */


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value1 = 2.5
        let value2 = 9.7
        let value3 = 6.9
        let value4 = 8.2
        
        let newValue1 = modf(value1)
        let newValue2 = modf(value2)
        let newValue3 = modf(value3)
        let newValue4 = modf(value4)
        
        let vholePart = newValue1.0 + newValue2.0 + newValue3.0 + newValue4.0
        print("Sum whole part of numbers is: \(vholePart)")
        
        let fractionalPart = newValue1.1 + newValue2.1 + newValue3.1 + newValue4.1
        let formFractionalPart = String(format: "%.1f", fractionalPart)
        print("Sum fractional part of numbers is: \(formFractionalPart)")
        
    }
}

