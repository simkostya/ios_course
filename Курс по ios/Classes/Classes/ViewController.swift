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
    
    var coca = Drink(name: "Coca", price: 3, country: "USA", balance: 10)
    var sprite = Drink(name: "Sprite", price: 4, country: "Germany", balance: 9)
    var fanta = Drink(name: "Fanta", price: 5, country: "Spain", balance: 8)
    var pepsi = Drink(name: "Pepsi", price: 2, country: "Poland", balance: 7)

    lazy var picture: UIImageView = {
        var pic = UIImageView()
        pic.frame = CGRect(x: view.layer.frame.width / 2 - 100, y: view.layer.frame.height / 6, width: 200, height: 200)
        pic.image = UIImage(named: "image1")
        return pic
    }()
    
    lazy var myLabelPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 400, width: 200, height: 35)
        label.text = "Стоимость:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelPriceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 130, y: 400, width: 200, height: 35)
        label.text = "\(coca.price) BYN"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelRemains: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 430, width: 200, height: 35)
        label.text = "Остаток:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelRemainsValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 130, y: 430, width: 200, height: 35)
        label.text = "\(coca.balance) шт."
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelCountry: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 460, width: 200, height: 35)
        label.text = "Страна:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelCountryValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 130, y: 460, width: 200, height: 35)
        label.text = "\(coca.country)"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelTotalCash: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 660, width: 200, height: 35)
        label.text = "Выручка"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelTotalCashValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 130, y: 660, width: 200, height: 35)
        label.text = "TotalCash"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelTotalVolume: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 690, width: 200, height: 35)
        label.text = "Продано"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myLabelTotalVolumeValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 130, y: 690, width: 200, height: 35)
        label.text = "TotalVolume"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var myBuyButton: UIButton = {
        let buyButton = UIButton(type: .system)
        buyButton.configuration = .borderedProminent()
        buyButton.setTitle("Купить", for: .normal)
        buyButton.frame = CGRect(x: view.layer.frame.width / 2 - 65, y: 510, width: 130, height: 36)
        buyButton.layer.cornerRadius = 4
        buyButton.addTarget(self, action: #selector(self.buySomeDrink(_:)), for: UIControl.Event.touchUpInside)
        return buyButton
    }()
    
    lazy var myResetButton: UIButton = {
        let resetButton = UIButton(type: .system)
        resetButton.configuration = .tinted()
        resetButton.setTitle("Новая смена", for: .normal)
        resetButton.frame = CGRect(x: view.layer.frame.width / 2 - 65, y: 560, width: 130, height: 36)
        resetButton.layer.cornerRadius = 4
        resetButton.addTarget(self, action: #selector(self.startNewShift(_:)), for: UIControl.Event.touchUpInside)
        return resetButton
    }()
    
    lazy var myUpdateButton: UIButton = {
        let updateButton = UIButton(type: .system)
        updateButton.configuration = .gray()
        updateButton.setTitle("Обновить", for: .normal)
        updateButton.frame = CGRect(x: view.layer.frame.width / 2 - 65, y: 610, width: 130, height: 36)
        updateButton.layer.cornerRadius = 4
        updateButton.addTarget(self, action: #selector(self.updateRemains(_:)), for: UIControl.Event.touchUpInside)
        return updateButton
    }()
    
    

    lazy var mySegmentedControl: UISegmentedControl = {
        let mySegmentedControl = UISegmentedControl(items: ["\(coca.name)","\(sprite.name)","\(fanta.name)","\(pepsi.name)"])
        mySegmentedControl.frame = CGRect(x: 20, y: view.layer.frame.width / 5, width: view.layer.frame.width - 40, height: 35)
        mySegmentedControl.selectedSegmentIndex = 0
        mySegmentedControl.selectedSegmentTintColor = UIColor.systemYellow
        mySegmentedControl.backgroundColor = UIColor.systemGray6
        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        return mySegmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myUpdateButton)
        self.view.addSubview(myResetButton)
        self.view.addSubview(myBuyButton)
        self.view.addSubview(myLabelPrice)
        self.view.addSubview(myLabelPriceValue)
        self.view.addSubview(myLabelRemains)
        self.view.addSubview(myLabelRemainsValue)
        self.view.addSubview(myLabelCountry)
        self.view.addSubview(myLabelCountryValue)
        self.view.addSubview(myLabelTotalCash)
        self.view.addSubview(myLabelTotalCashValue)
        self.view.addSubview(myLabelTotalVolume)
        self.view.addSubview(myLabelTotalVolumeValue)
        self.view.addSubview(picture)
        self.view.addSubview(mySegmentedControl)
        updateUI()
    }
    
    func updateUI() {
        myLabelTotalCashValue.text = "\(DrinkShop.shared.totalCash) BYN"
        myLabelTotalVolumeValue.text = "\(DrinkShop.shared.totalVolume) шт."
        if mySegmentedControl.selectedSegmentIndex == 0 {
            myLabelRemainsValue.text = "\(coca.balance) шт."
        } else if mySegmentedControl.selectedSegmentIndex == 1 {
            myLabelRemainsValue.text = "\(sprite.balance) шт."
        } else if mySegmentedControl.selectedSegmentIndex == 2 {
            myLabelRemainsValue.text = "\(fanta.balance) шт."
        } else if mySegmentedControl.selectedSegmentIndex == 3 {
            myLabelRemainsValue.text = "\(pepsi.balance) шт."
        }
    }
    
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        picture.contentMode = .scaleAspectFit
        switch sender.selectedSegmentIndex {
        case 0:
            picture.image = UIImage(named: "image1")
            myLabelPriceValue.text = "\(coca.price) BYN"
            myLabelRemainsValue.text = "\(coca.balance) шт."
            myLabelCountryValue.text = "\(coca.country)"
            
            if coca.balance == 0 {
                myBuyButton.isEnabled = false
            } else {
                myBuyButton.isEnabled = true
            }
            
        case 1:
            picture.image = UIImage(named: "image2")
            myLabelPriceValue.text = "\(sprite.price) BYN"
            myLabelRemainsValue.text = "\(sprite.balance) шт."
            myLabelCountryValue.text = "\(sprite.country)"
            if sprite.balance == 0 {
                myBuyButton.isEnabled = false
            } else {
                myBuyButton.isEnabled = true
            }
           
        case 2:
            picture.image = UIImage(named: "image3")
            myLabelPriceValue.text = "\(fanta.price) BYN"
            myLabelRemainsValue.text = "\(fanta.balance) шт."
            myLabelCountryValue.text = "\(fanta.country)"
            if fanta.balance == 0 {
                myBuyButton.isEnabled = false
            } else {
                myBuyButton.isEnabled = true
            }
        case 3:
            picture.image = UIImage(named: "image4")
            myLabelPriceValue.text = "\(pepsi.price) BYN"
            myLabelRemainsValue.text = "\(pepsi.balance) шт."
            myLabelCountryValue.text = "\(pepsi.country)"
            if pepsi.balance == 0 {
                myBuyButton.isEnabled = false
            } else {
                myBuyButton.isEnabled = true
            }
        default:
            break
        }
    }
    
    @objc func buySomeDrink(_ sender:UISegmentedControl!) {
        if mySegmentedControl.selectedSegmentIndex == 0 {

            DrinkShop.shared.buyIt(coca)
            updateUI()
            if coca.balance < 1 {
                myBuyButton.isEnabled = false
            }
        }
        if mySegmentedControl.selectedSegmentIndex == 1 {
            DrinkShop.shared.buyIt(sprite)
            updateUI()
            if sprite.balance < 1 {
                myBuyButton.isEnabled = false
            }
        }
        if mySegmentedControl.selectedSegmentIndex == 2 {
            DrinkShop.shared.buyIt(fanta)
            updateUI()
            if fanta.balance < 1 {
                myBuyButton.isEnabled = false
            }
        }
        if mySegmentedControl.selectedSegmentIndex == 3 {
            DrinkShop.shared.buyIt(pepsi)
            updateUI()
            if pepsi.balance < 1 {
                myBuyButton.isEnabled = false
            }
        }
    }
    
    @objc func startNewShift(_ sender: Any) {
        DrinkShop.shared.totalCash = 0
        DrinkShop.shared.totalVolume = 0
        updateUI()
    }
    
    @objc func updateRemains(_ sender: Any) {
        coca.balance = 10
        sprite.balance = 9
        fanta.balance = 8
        pepsi.balance = 7
        myBuyButton.isEnabled = true
        updateUI()
    }
}

