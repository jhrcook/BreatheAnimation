//
//  ContentView.swift
//  BreatheAnimation WatchKit Extension
//
//  Created by Joshua on 6/30/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct Leaf: View {
    var body: some View {
        Circle()
            .frame(width: 25, height: 25)
            .foregroundColor(Color("leafColor"))
    }
}

struct ContentView: View {
    
    @State private var isAtMaxScale = false
    
    private let numberOfLeaves = 6
    private var rotationOffset = 360.0 / 6.0
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            ForEach(0..<numberOfLeaves) { i in
                Leaf()
                    .opacity(self.isAtMaxScale ? 0.9 : 0.5)
                    .scaleEffect(self.isAtMaxScale ? 1 : 3.2)
                    .offset(self.isAtMaxScale ? CGSize(width: 0, height: 0) : CGSize(width: 25, height: 25))
                    .rotationEffect(
                        self.isAtMaxScale ?
                        Angle(degrees: Double(i) * self.rotationOffset) :
                        Angle(degrees: 90.0 + (Double(i) * self.rotationOffset))
                    )
                    .onAppear {
                        withAnimation(
                            Animation.easeInOut(duration: 3)
                                .delay(0.5)
                                .repeatForever(autoreverses: true)) {
                            self.isAtMaxScale.toggle()
                        }
                    }
            }
            
        }
        .frame(idealWidth: 300, idealHeight: 300, alignment: .center)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
