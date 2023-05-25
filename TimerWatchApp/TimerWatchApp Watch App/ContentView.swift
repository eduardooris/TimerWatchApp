//
//  ContentView.swift
//  TimerWatchApp Watch App
//
//  Created by tecnorise desenvolvimento on 25/05/23.
//

import SwiftUI

struct ContentView: View {
  @State var minutes:Int = 0
  @State var seconds:Int = 0
    var body: some View {
      NavigationStack {
        HStack {
          Picker(selection: $minutes, label: Text("Minutos")) {
            ForEach(0...59, id: \.self) { counter in
              Text("\(counter)")
            }
          }
          Picker(selection: $seconds, label: Text("Segundos")) {
              ForEach(0...59, id: \.self) { number in Text("\(number)")}
          }
        }
        VStack {
            NavigationLink(destination: CountdownView(minute: minutes, seconds: seconds)) {
                Text("Go")
            }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
