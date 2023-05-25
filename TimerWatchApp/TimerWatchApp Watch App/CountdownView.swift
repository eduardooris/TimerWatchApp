//
//  CountdownView.swift
//  TimerWatchApp Watch App
//
//  Created by tecnorise desenvolvimento on 25/05/23.
//

import SwiftUI

struct CountdownView: View {
  @State var minute: Int
  @State var seconds: Int
 
  func countdown() {
      Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        if(minute == 0 && seconds == 0) {
          timer.invalidate()
        } else if seconds > 0 {
          seconds -= 1
        } else {
          minute -= 1
          seconds = 59
        }
      }
  }
    var body: some View {
      VStack {
        if minute == 0 {
          seconds < 10 ? Text("0\(seconds)") : Text("\(seconds)")
        } else {
          minute < 10 && seconds < 10 ? Text("0\(minute) : 0\(seconds)") : seconds < 10 && minute >= 10 ? Text("\(minute) : 0\(seconds)") : seconds >= 10 && minute < 10 ? Text("0\(minute) : \(seconds)") : Text("\(minute) : \(seconds)")
        }
       
        if minute == 0 && seconds == 0 {
          VStack {
            Text("Tempo esgotado")
              .padding()
          }
            .background(.red)
            .padding()
        }
      }
      .onAppear(perform: countdown)
      .navigationTitle("Timer")
    }
   
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
          CountdownView(minute: 0, seconds: 0)
      }
    }
}
