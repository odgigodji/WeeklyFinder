//
//  ViewController.swift
//  Weeklyfinder
//
//  Created by Nelson Amerei on 9/15/21.
//  Copyright © 2021 School21 namerei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dayField.text, let month = monthField.text, let year = yearField.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
         dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        //http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
        dateFormatter.dateFormat = "EEEE" // date of the day
        
//        dateFormatter.locale = Locale(identifier: "ru_RU")
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        resultLabel.text = capitalizedWeekday
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

/*
 свойство label - lines: если пишем 0 - текст подстраивается автоматически под размер который мы выставим
 чтобы клавиатура отображала только цифры ставим в Attribute inspector/keyboard type = number
 */
