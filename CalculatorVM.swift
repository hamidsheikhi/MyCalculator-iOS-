//
//  CalculatorVM.swift
//  ICalculator
//
//  Created by hamid sheikhi on 2020. 07. 15..
//  Copyright © 2020. hamid sheikhi. All rights reserved.
//

import SwiftUI

class CalculatorVM: ObservableObject {
    
    @Published var result:String = "0"
    @Published var fontSize = 90
    
    var numberFormatter:NumberFormatter = NumberFormatter()
    var unformattedNumberValue:String = "0"
    
    var activeOperation:String = ""
    var previousValue:Double = 0
    
    init() {
        self.numberFormatter.usesGroupingSeparator = true
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.locale = Locale.current
    }
    
    func getFontSize() {
        switch self.unformattedNumberValue.count {
        case 7:
            self.fontSize = 80
        case 8:
            self.fontSize = 70
        case 9:
            self.fontSize = 60
        default:
            self.fontSize = 90
            
        }
        
    }
    func handleKeyPress(key: Key) {
        if key.type == KeyType.Operator {
            self.handleOperationSelection(label: key.label)
            
        } else {
        switch key.label {
        case "AC":
            self.reset()
        case "C":
            self.cancel()
        default:
            self.handleNumberSelection(label: key.label)
        }
    }
}
    
    func handleOperationSelection(label: String) {
        var calculatedValue:Double = 0
        let currentNumber:Double = Double(unformattedNumberValue) ?? 0
        
        if (activeOperation != "") {
            switch activeOperation {
            case "+":
                calculatedValue = previousValue + currentNumber
            case "-":
                calculatedValue = previousValue - currentNumber
            case "*":
                calculatedValue = previousValue * currentNumber
            case "/":
                calculatedValue = previousValue > 0 ? previousValue / currentNumber : 0
            default:
                // This will be used for equal and other operations
                // That are not implemented
                calculatedValue = previousValue
            }
            previousValue = calculatedValue
                 result = formatNumber(value: String(calculatedValue))
            
        } else {
            activeOperation = label
            previousValue = previousValue > 0 ? previousValue : currentNumber
            
        }
        
        activeOperation = label != "=" && label != "%" && label != "+/-" ? label : ""
        
        unformattedNumberValue = "0"
        
    }
    
    func handleNumberSelection(label: String) {
        if (self.unformattedNumberValue.count == 0 || self.unformattedNumberValue.count < 9) {
            self.unformattedNumberValue = result == "0" ? label : unformattedNumberValue + label
            self.result = self.formatNumber(value: self.unformattedNumberValue)
            self.getFontSize()
               
              }
        
    }
    
    func cancel() {
        unformattedNumberValue = "0"
        result = "0"
        
        
    }
    
    func reset() {
        self.cancel()
        self.activeOperation = ""
        self.previousValue = 0
        
        
    }
    
    func formatNumber(value:String) -> String {
        var formattedValue = value
        
        if let doubleValue = Double(formattedValue) {
            formattedValue = self.numberFormatter.string(from: NSNumber(value: doubleValue)) ?? value
        }
        
        
        return formattedValue
        
    }
    
    func getKeys() -> [[Key]] {
        
        let cancel = self.result == "0" ? "AC" : "C";
        
        return   [
              
              [
                     Key(label: "AC", color: Color.purple, labelColor: Color.black),
                     Key(label: "+/-", color: Color.purple, labelColor: Color.black, type: KeyType.Operator),
                     Key(label: "%", color: Color.purple, labelColor: Color.black, type: KeyType.Operator),
                     Key(label: "/", color: Color.purple, labelColor: Color.black, type: KeyType.Operator),
                 
               ],
          [
                  Key(label: "7"),
                  Key(label: "8"),
                  Key(label: "9"),
                  Key(label: "*", color: Color.purple, labelColor: Color.black, type: KeyType.Operator),
              ],
          [
                    Key(label: "4"),
                    Key(label: "5"),
                    Key(label: "6"),
                    Key(label: "-", color: Color.purple, labelColor: Color.black, type: KeyType.Operator),
                ],
          [
                    Key(label: "1"),
                    Key(label: "2"),
                    Key(label: "3"),
                    Key(label: "+", color: Color.purple, labelColor: Color.black, type: KeyType.Operator),
                ],
          [
              Key(label: "0"),
              Key(label: ","),
              Key(label: "=", color: Color.blue, labelColor: Color.black, type: KeyType.Operator),
          ],
          ]
    }
}
