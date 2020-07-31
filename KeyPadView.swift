//
//  KeyPadView.swift
//  ICalculator
//
//  Created by hamid sheikhi on 2020. 07. 15..
//  Copyright © 2020. hamid sheikhi. All rights reserved.
//

import SwiftUI

struct KeyPadView:View {
       @EnvironmentObject var calculatorVM:CalculatorVM
     var body: some View {
        let keys:[[Key]] = calculatorVM.getKeys()
        return VStack(spacing: 12) {
             ForEach(0 ..< keys.count) { index in
                 HStack (spacing: 12) {
                     ForEach(0..<keys[index].count) { innerIndex in
                        KeyView(key: keys[index][innerIndex])
                            
                     }
                 }
             }
         }
         
     }
 }
 


