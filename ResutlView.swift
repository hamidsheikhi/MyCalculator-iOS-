//
//  ResutlView.swift
//  ICalculator
//
//  Created by hamid sheikhi on 2020. 07. 15..
//  Copyright © 2020. hamid sheikhi. All rights reserved.
//

import SwiftUI

 struct ResultView: View {
    @EnvironmentObject var calculatorVM:CalculatorVM
    
    var body: some View {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                                
                    Text(calculatorVM.result)
                    .foregroundColor(Color.white)
                    .font(.system(size: CGFloat(calculatorVM.fontSize)))
                    .padding(.trailing, 30)
            }
        }
    }
}
    


