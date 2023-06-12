//
//  ContentView.swift
//  WWDC2022-Grid
//
//  Created by qjc on 2023/6/11.
//

import SwiftUI

struct ContentView: View {
    @State var voters = [
        Voters(type: "Lu Renjia", color: .red, votes: 20),
        Voters(type: "Kris", color: .blue,votes: 9),
        Voters(type: "Wangwu", color: .yellow),
    ]

    @State var totalVotes = 29

    var body: some View {
        VStack{
            Grid(alignment: .leading){
                ForEach($voters){ $voter in
                    GridRow{
                        Text(voter.type)
                        ProgressView(
                            value: Double(voter.votes),
                            total: Double(max(1, totalVotes)))
                        Text("\(voter.votes)")
                            .gridColumnAlignment(.trailing)
                    }
                    GridRow{
                        Divider().gridCellColumns(3)
                    }
                }
            }.padding()
            MyEqualWidthHStack{
                ForEach($voters){ $voter in
                    Button{
                        voter.votes += 1
                        totalVotes += 1
                    }label: {
                        Text(voter.type)
                            .frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered)
                    
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
