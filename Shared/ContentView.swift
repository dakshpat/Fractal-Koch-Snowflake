//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 2/13/22.
//
import Foundation
import SwiftUI


struct ContentView: View {
    @State var guess = ""
    @State private var totalIterations: Int? = 0
    @State private var kochAngle: Int? = 3
    @State var editedKochAngle: Int? = 3
    @State var editedTotalIterations: Int? = 0
    @State var viewArray :[AnyView] = []
    
        
    private var intFormatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            return f
        }()
        
        var body: some View {
        
           VStack {
               VStack{
            
            ZStack {
                
                KochView(iterationsFromParent: $totalIterations, angleFromParent: $kochAngle).drawingGroup()
                    
                // Stop the window shrinking to zero.
                Spacer()
            }.frame(minHeight: 600, maxHeight: 600)
                       .frame(minWidth: 600, maxWidth: 600)
               }
            
            VStack{
                HStack{
                    
                    Text(verbatim: "Iterations:")
                    .padding()
                    TextField("Number of Iterations (must be between 0 and 7 inclusive)", value: $editedTotalIterations, formatter: intFormatter, onCommit: {
                        self.totalIterations = self.editedTotalIterations
                    })
                
                        .padding()
                    
                    }
                
                HStack{
                    
                    Text(verbatim: "Angle π/number:")
                    .padding()
                    TextField("The angle of the Fractal is π/number entered. Must be between 1 and 50.", value: $editedKochAngle, formatter: intFormatter, onCommit: {
                        self.kochAngle = self.editedKochAngle
                    })
                
                        .padding()
                    
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
