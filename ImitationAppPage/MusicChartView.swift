import SwiftUI

// 6. 排行榜列表的單一列 View
struct ChartItemRow: View {
    let imageName: String
    let title: String
    let subtitle: String
    let textWidth: CGFloat

    init(
        imageName: String,
        title: String,
        subtitle: String,
        textWidth: CGFloat = 180
    ) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.textWidth = textWidth
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: textWidth, alignment: .leading) // 固定文字容器寬度
                    .lineLimit(2)                                  // 最多兩行
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(width: textWidth, alignment: .leading)  // 和標題同寬
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct MusicChartsView<Header: View>: View {
    // 自訂標題 View
    let header: Header
    // 每個項目都帶有自己的副標題
    let groups: [[(image: String, title: String, subtitle: String)]]
    let itemTextWidth: CGFloat
    let sectionHeight: CGFloat
    let columnSpacing: CGFloat
    
    init(
        @ViewBuilder header: () -> Header,
        groups: [[(image: String, title: String, subtitle: String)]],
        itemTextWidth: CGFloat = 180,
        sectionHeight: CGFloat = 350,
        columnSpacing: CGFloat = 12
    ) {
        self.header = header()
        self.groups = groups
        self.itemTextWidth = itemTextWidth
        self.sectionHeight = sectionHeight
        self.columnSpacing = columnSpacing
    }
    
    var body: some View {
        ZStack {
            Color(red:41/255.0,green:41/255.0,blue:41/255.0)
            // 區塊內容
            VStack(alignment: .leading, spacing: 20) {
                // 標題（可自訂，支援圖示 + 文字）
                HStack(alignment: .top) {
                    header
                        .font(.system(size: 22))       // 預設標題字級
                        .foregroundColor(.white)        // 預設文字顏色
                    Spacer()
                }
                .padding([.top, .horizontal])
                
                // 左右「平滑」滑動的內容
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: columnSpacing) {
                        ForEach(groups.indices, id: \.self) { index in
                            VStack(spacing: 0) {
                                ForEach(groups[index].indices, id: \.self) { rowIndex in
                                    let item = groups[index][rowIndex]
                                    ChartItemRow(
                                        imageName: item.image,
                                        title: item.title,
                                        subtitle: item.subtitle,
                                        textWidth: itemTextWidth
                                    )
                                }
                            }
                            // 視需要保留一點底部空間
                            .padding(.bottom)
                        }
                    }
                    .padding(.horizontal) // 左右整體邊距
                }
                .frame(height: sectionHeight) // 由外部控制高度
            }
        }
        // 外距交由父層統一控制
    }
}

