import SwiftUI

// 5. 音樂列表橫向捲動 (Music Horizontal Row)
struct MusicRowView<Title: View, Item: View>: View {
    let title: Title
    var items: [Item]
    var showMore: Bool = false
    var height: CGFloat? = nil
    var topPadding: CGFloat = 15
    var bottomPadding: CGFloat = 15
    var useGradientBackground: Bool = false
    
    init(
        items: [Item],
        showMore: Bool = false,
        height: CGFloat? = nil,
        topPadding: CGFloat = 15,
        bottomPadding: CGFloat = 15,
        useGradientBackground: Bool = false,
        @ViewBuilder title: () -> Title
    ) {
        self.items = items
        self.showMore = showMore
        self.height = height
        self.topPadding = topPadding
        self.bottomPadding = bottomPadding
        self.useGradientBackground = useGradientBackground
        self.title = title()
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if useGradientBackground {
                // 漸層玻璃感背景（含細描邊與陰影）
                RoundedRectangle(cornerRadius: 5)
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.gray.opacity(0.4),        // 中間顏色
                                Color.black.opacity(0.3)        // 兩邊顏色
                            ]),
                            center: .center,
                            startRadius: 100,
                            endRadius: 270
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
                    )
                    .shadow(color: .black.opacity(0.7), radius: 3, x: 0, y: 3)
            } else {
                // 純色背景
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 41/255, green: 41/255, blue: 41/255))
            }
            
            VStack(alignment: .leading, spacing: 15) { // VStack
                HStack {
                    title
                        .font(.system(size: 22))
                        .padding(.top,10)
                    
                    Spacer()
                    
                    if showMore {
                        HStack(spacing: 5) {
                            Text("更多") // Text
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Image(systemName: "chevron.right") // Image (SF Symbol)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                        .padding(.top,7)
                    }
                }
                .padding(.horizontal)
                
                // ScrollView 實現橫向捲動
                ScrollView(.horizontal, showsIndicators: false) { // ScrollView
                    HStack(spacing: 15) { // HStack
                        ForEach(items.indices, id: \.self) { index in
                            items[index]
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(height: height ?? 250, alignment: .top)
        .padding(.top, topPadding)
        .padding(.bottom, 0) // 統一由父層控制相鄰區塊間距
    }
}
