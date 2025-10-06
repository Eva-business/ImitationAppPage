import SwiftUI

struct BottomTabBarView: View {
    let icons: [(icon: String, title: String)] = [
        ("house.fill", "首頁"),
        ("square.grid.2x2", "單曲＆節目"),
        ("widget.large", "動態"),
        ("books.vertical.fill", "媒體庫")
    ]

    @State private var selectedIndex = 0 // 紀錄目前選中

    var body: some View {
        HStack(spacing: 0) {
            ForEach(icons.indices, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: icons[index].icon)
                            .resizable() // 可調整大小
                            .scaledToFit()
                            .frame(width: 20, height: 20) // 固定大小，避免不同圖標偏移
                        
                        Text(icons[index].title)
                            .font(.caption2)
                            .lineLimit(1)
                            .frame(height: 12) // 固定高度，保持基線一致
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .background(
                        selectedIndex == index ? Color.gray.opacity(0.3) : Color.clear
                    )
                }
            }
        }
        .frame(height: 50)
        .padding(.bottom, 20) // 模擬底部安全區
        .background(Color.black)
    }
}
