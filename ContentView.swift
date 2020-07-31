//
//  ContentView.swift
//  ICalculator
//
//  Created by hamid sheikhi on 2020. 07. 15..
//  Copyright © 2020. hamid sheikhi. All rights reserved.
//

import SwiftUI


 //   let keys:[[Key]] =
      
    
struct ContentView: View {
    var calculatorVM:CalculatorVM = CalculatorVM()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ResultView()
                KeyPadView()
            }
        }.environmentObject(calculatorVM)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




