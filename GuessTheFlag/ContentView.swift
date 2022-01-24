//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by daniel on 2022-01-24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
//        VStack(alignment: .center, spacing: 10) {
//            Text("Hello World")
//            Text("This is inside a stack")
//            Text("First")
//            Text("Second")
//            Text("Third")
////            Spacer()
//            ZStack {
//                Color.red.edgesIgnoringSafeArea(.all)
//                Text("Your content")
//            }
//
//            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
//
//            RadialGradient(gradient: Gradient(colors: [.red, .black]), center: .center, startRadius: 20, endRadius: 200)
//            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//
//            Button {
//                print("Button was tapped")
//            } label: {
//                HStack(spacing: 10) {
//                    Image(systemName: "pencil")
//                    Text("Edit")
//                }
//            }
//        }
        
//        Button {
//            showingAlert = true
//        } label: {
//            Text("Show Alert")
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button(role: .destructive) {} label: {Text("Cancel")}
//            Button(role: .cancel) {} label: {Text("OK")}
//        }
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        self.flagTapped(number)
                    } label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ??")
        }
        

    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
