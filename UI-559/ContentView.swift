//
//  ContentView.swift
//  UI-559
//
//  Created by nyannyan0328 on 2022/05/09.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Tab = .bookMark
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection: $currentTab) {
                
                
                Text("A")
                    .fullBG()
                    .tag(Tab.bookMark)
                
                
                Text("B")
                    .fullBG()
                    .tag(Tab.Camera)
                
                
                Text("C")
                    .fullBG()
                    .tag(Tab.Chat)
                
                
                Text("D")
                    .fullBG()
                    .tag(Tab.Settings)
                
                
                Text("E")
                    .fullBG()
                    .tag(Tab.Time)
                
                
               
                
            }
            CustomTabView(currentTab: $currentTab)
        }
        
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func fullBG()->some View{
        
    Color("BG")
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .ignoresSafeArea()
    }
}
enum Tab : String,CaseIterable{
    
    case bookMark = "Bookmark"
    case Camera = "Camera"
    case Chat = "Chat"
    case Settings = "Settings"
    case Time = "Time"
}

