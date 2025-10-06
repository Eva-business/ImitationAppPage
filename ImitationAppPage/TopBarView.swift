import SwiftUI

// 1. 頂部導航列 (Top Bar)
struct TopBarView: View {
    var body: some View {
        HStack { // HStack
            Image(systemName: "gearshape") // Image (SF Symbol)                 .font(.title2)
                .foregroundColor(.white)
            
            Spacer()
            
            Image("title")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            
            Spacer()
            
            Image(systemName: "bell") // Image (SF Symbol)
                .font(.title2)
                .foregroundColor(.white)
            
            Spacer()
                .frame(width: 25)
            
            Image(systemName: "magnifyingglass") // Image (SF Symbol)
                .font(.title2)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.top, 5) // 頂部空間
        .background(Color(red: 17/255.0, green: 17/255.0, blue: 17/255.0)) // TopBar 背景顏色 (17,17,17)
    }
}
