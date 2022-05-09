//
//  CustomTabView.swift
//  UI-559
//
//  Created by nyannyan0328 on 2022/05/09.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab : Tab
    @State var yOffset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let widht = proxy.size.width
            HStack{
                
                ForEach(Tab.allCases,id:\.rawValue){tab in
                    
                    Button {
                        withAnimation{
                            
                            currentTab = tab
                            yOffset = -80
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.08)){
                            
                            yOffset = 0
                        }
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(currentTab == tab ? getColor() : .gray)
                            .frame(width: 25, height: 25)
                            .frame(maxWidth:.infinity)
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }

                       
                }
            }
            .frame(maxWidth:.infinity)
            .background(alignment:.leading){
                
                
                Circle()
                    .fill(Color("Yellow"))
                    .frame(width: 25, height: 25)
                    .offset(x: 10, y: yOffset)
                    .offset(x: indicatorOffset(width: widht))
            }
        }
        .padding([.bottom,.top])
        .frame(height: 30)
    }
    
    func indicatorOffset(width : CGFloat)->CGFloat{
        
        let index = CGFloat(getIndex())
        if index == 0 {return 0}
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
        
    }
    func getIndex()->Int{
        
        switch currentTab {
        case .bookMark:
                return 0
        case .Camera:
            return 1
        case .Chat:
            return 2
        case .Settings:
            return 3
        case .Time:
            return 4
        }
    }
    
    func getColor()->Color{
        
        switch currentTab {
        case .bookMark:
            return Color("Purple")
        case .Camera:
            return.green
        case .Chat:
            return.orange
        case .Settings:
            return.purple
        case .Time:
            return.pink
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
