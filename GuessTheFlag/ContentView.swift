//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mati Shirzad on 2/21/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Afghanistan", "US", "UK", "France", "Germany", "UAE", "Brazil", "Qatar", "China", "Japan", "Uzbekistan", "Spain", "Greece", "Italy", "Egypt", "Poland", "Ireland", "Iceland", "Austria", "Austerial", "Azurbiajan", "Bahama", "Bangladish", "Belz", "Columbia", "Croatia", "Cuba", "Denmark", "Fiji", "Finland", "Ghana", "Granada", "Indonisia", "Iran", "Iraq", "Jordan", "Kazakistan", "Kerkezistan", "Kombucha", "Labia", "Lebonan", "Maldive", "Malisia", "Nepal", "Pakistan", "Panama", "Portugal", "Singapor", "Sirya", "Sri Lanka", "Swiss", "Tajikistan", "Thailand", "Turkey", "Turkmenistan", "Ukraine"].shuffled()
    @State var correctGuess = Int.random(in: 0...3)
    @State var showAlert = false
    @State var alerMsg = ""
    @State var score = 0
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                Text("Tap the Flag of")
                    .foregroundColor(.white)
                Text("\(countries[correctGuess])")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                }
                VStack{
                    ForEach(0..<4){ number in
                        Button(action:{
                            checkAnswer(number)
                        }){
                            Image(countries[number])
                                .resizable()
                                .frame(width: 280, height: 150)
                                .shadow(color: .black, radius: 5)
                        }
                    }
                }
                Spacer()
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alerMsg), message: Text("Your Score: \(score)"),
                      dismissButton: .default(Text("Continue"), action: {changeQuestion()})
                      )
                })
            }
        }
    
    func checkAnswer(_ number:Int){
        if number == correctGuess{
            alerMsg = "Correct"
            score += 1
        }else{
            alerMsg = "Worng! Score Deducted"
            score -= 1
        }
        showAlert = true
    }
    
    func changeQuestion(){
        countries.shuffle()
        correctGuess = Int.random(in:0...3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
