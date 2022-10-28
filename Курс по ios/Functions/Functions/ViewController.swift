//
//  ViewController.swift
//  Functions
//
//  Created by Костя Симончик on 26.10.22.
//

/*
 Домашнее задание:
 Основное:
 1. Написать универсальные функции сложения, вычитания, умножения и деления, которые принимают 2 Int (Пример: sum(value1: Int, value2: Int) -> Int), и использовать из в примере вычесления вместо стандартных +, -, *, / и сделать их глобальными
 2. Написать функцию, которая считает сумму цифр четырехзначного числа (func calcNumbers(value: Int)), для условности будем считать, что в функции будет передаваться 4-значное число (1999 -> 1 + 9 + 9 + 9)
 3. Написать функцию сравнения 2 строк и возвращающую самую длинную строку
 4. Циклический вызов функций - поломать приложение (написать функцию, которая вызывает сама себя)
 5. Написать функцию возведения в степень с дефолтным параметром (makePower), по умолчанию возводит число во вторую степень, но степень можно указать
 6. Написать функцию, которая принимает строку, добаляет к ней смайлики. Вернуть результат и распечатать.
 Дополнительно:
 1. Функция вычисления факториала числа
 2. Функция вычисления ряда фибоначи
 */


import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Task 1
//        sum(value1: 5, value2: 6)
//        dif(value1: 40, value2: 342)
//        increase(value1: 3, value2: 2)
//        division(value1: 45, value2: 34)
// Task 2
//        calcNumbers(value: 1993)
// Task 3
//        compareString(str1: randomString(), str2: randomString())
// Task 4
//        recurse()
// Task 5
//        makePow(myValue: 12)
//        makePow(myValue: 12, myPow: 3)
//
// Task 6
//        modifyString(myString: "my String witj emoji")
//
//        factorial(n: 22)
//        fibonacci(n: 10)
    }
    
    func sum(value1: Int, value2: Int){
        let resultSum = value1 + value2
        print(resultSum)
    }
    
    func dif(value1: Int, value2: Int){
        let resultDif = value1 - value2
        print(resultDif)
    }
    
    func increase(value1: Int, value2: Int){
        let resultIncrease = value1 * value2
        print(resultIncrease)
    }
    
    func division(value1: Int, value2: Int){
        let resultDivision = value1 / value2
        print(resultDivision)
    }
    
    func calcNumbers(value: Int) {
        let valueToString = String(value)
        let arrayOfElement = valueToString.compactMap{ $0.wholeNumberValue }
        let totalSum = arrayOfElement.reduce(0, +)
        print(totalSum)
    }
    
    func compareString(str1: String, str2: String) {
        if str1.count > str2.count {
            print("\(str1.count) символов в строке\n[\(str1)]\nбольше чем\n\(str2.count) символов в строке [\(str2)]")
        } else if str2.count > str1.count {
            print("\(str1.count) символов в строке\n[\(str1)]\nменьше чем\n\(str2.count) символов в строке [\(str2)]")
        } else {
            print("строки равны")
        }
    }
    
    func randomString() -> String {
        let length = Int.random(in: 20..<300)
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func recurse() {
        let value = 10000000000
        let result = value + 1
        if result > value {
            print(result)
            recurse()
        }
    }
    
    func makePow (myValue: Int, myPow: Int = 2) {
        let resultPow = pow(Decimal(myValue), myPow)
        print("Число \(myValue) в степени \(myPow) равно: \(resultPow)")
    }
    
    func modifyString(myString: String) {
        let smileString = " 😆🙂🥰😚😜😝😙🙂🥲🥹😃😄"
        let newString = myString.appending(smileString)
        print(newString)
    }
    
    func factorial(n: Int) {
        guard n < 20 else { return print("Факториал числа \(n) не вычислен, введите число меньше 20")}
        var result = 1
        if(n > 0) {
            for i in 1...n {
                result *= i
            }
        }
        print("Факториал числа \(n) равно \(result)")
    }
    
    func fibonacci(n: Int){
        assert(n > 1)
        var array = [0, 1]
        while array.count < n {
            array.append(array[array.count - 1] + array[array.count - 2])
        }
        print("Последовательность Фибоначчи из числа \(n): \(array)")
    }
}


