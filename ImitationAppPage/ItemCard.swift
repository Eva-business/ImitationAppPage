import SwiftUI

struct MusicItemCard: View {
    var title: String
    var subtitle: String
    var isHistory: Bool = false
    var imageName: String? = nil
    var isHistoryList: Bool = false
    var isweekitem: Bool = false
    var weeknum: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .center) {// 背景
                Rectangle()
                    .fill(
                        isHistory
                        ? AnyShapeStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 13/255, green: 33/255, blue: 42/255),
                                    Color.blue.opacity(0.4)
                                ]),
                                startPoint: .topTrailing,
                                endPoint: .bottomLeading
                            )
                          )
                        : AnyShapeStyle(Color(.systemGray3))
                    )
                    .frame(width: 120, height: 120)
                    .cornerRadius(5)
                
                if isHistory {
                    Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .scaleEffect(x: -1, y: 1)
                } else if let imageName = imageName{
                    Image(imageName)           // 使用傳入的圖片名稱
                         .resizable()
                         .scaledToFit()
                         .cornerRadius(5)
                }
                if isHistoryList {
                    // 播放圖標（固定在上面）
                    Image(systemName: "play.circle")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                        .opacity(isHistory ? 0 : 0.8)
                        .offset(x: 0, y: 0)
                }
            }
            .overlay(alignment: .topLeading) {
                if isweekitem {
                    HStack(spacing: 0){
                        Image(systemName:"ellipsis.bubble.fill")
                        if let weeknum {
                            Text(weeknum)
                        }
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 13).bold())
                    .padding(4) // 內距，避免貼邊
                }
            }
            .padding(.bottom,10)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17).bold())
                    .foregroundColor(.white)
                    .lineLimit(2) // 最多兩行
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(height: 36, alignment: .top) // 固定高度，避免卡片跳動

                Text(subtitle)
                    .font(.system(size: 14).bold())
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .padding(.top,5)
            }
            .frame(height: 50, alignment: .bottom) // 固定文字區高度，卡片底部對齊
            
        }
        .frame(width: 120) // 卡片總寬
    }
}


struct PodcastItemCard: View {
    var title: String
    var subtitle: String
    var imageName: String? = nil

    var body: some View {
        ZStack { // 外層矩形背景
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 29/255, green: 29/255, blue: 29/255))
                .frame(width: 120, height: 190) // 長方形總高度
            
            VStack() {
                // 上半部分：圖片
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120) // 固定上半部分高度
                        .clipped()
                        .cornerRadius(5)
                }

                // 下半部分：標題 + 副標題
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 16).bold())
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(subtitle)
                        .font(.system(size: 14).bold())
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .frame(width: 120, height: 70)
            }
            .frame(width: 120, height: 190)
            .background(Color.clear)
            
            ZStack {
                // 外圈藍色
                Image(systemName: "circle.fill")
                    .font(.system(size: 23))
                    .foregroundColor(.blue)

                // 中間黑色三角形
                Image(systemName: "play.fill")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
            }
            .offset(x: 45, y: 20)

        }
        .frame(width: 120, height: 190)
    }
}

struct FollowItemCard: View {
    var title: String
    var subtitle: String
    var imageName: String? = nil
    // 內部狀態：按鈕點擊時會切換
    @State private var isFollowed: Bool

    // 保留原有參數名稱 isfollowed，作為初始值，避免破壞既有呼叫端
    init(title: String, subtitle: String, imageName: String? = nil, isfollowed: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self._isFollowed = State(initialValue: isfollowed)
    }
    
    var body: some View {
        ZStack { // 外層矩形背景
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(red: 29/255, green: 29/255, blue: 29/255))
                .frame(width: 120, height: 240) // 長方形總高度
            
            VStack(spacing: 0) {
                // 上半部分：圖片
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120) // 固定上半部分高度
                        .clipped()
                        .cornerRadius(5)
                }

                // 下半部分：標題 + 副標題
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.system(size: 17).bold())
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(subtitle)
                        .font(.system(size: 14).bold())
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    // 關注按鈕置中 + 額外上間距
                    HStack {
                        Spacer()
                        Button {
                            isFollowed.toggle()
                        } label: {
                            Text(isFollowed ? "正在關注" : "關注")
                                .font(.system(size: 18).weight(.semibold))
                                .foregroundColor(.white)
                                .frame(width: 90, height: 30) // 固定按鈕尺寸，避免切換時跑版
                                .background(
                                    isFollowed
                                    ? Color(red: 41/255, green: 41/255, blue: 41/255)
                                    : Color.blue
                                )
                                .overlay(
                                    Group {
                                        if isFollowed {
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.gray, lineWidth: 1)
                                        }
                                    }
                                )
                                .cornerRadius(15)
                        }
                        .buttonStyle(.plain) // 避免系統樣式造成大小變化
                        Spacer()
                    }
                    .frame(height: 32) // 固定容器高度，穩定上方文字位置
                    .padding(.top, 3)
                }
                .padding(.horizontal, 5)
                .frame(width: 120, height: 120, alignment: .topLeading) // 內容向上對齊，避免晃動
            }
            .frame(width: 120, height: 240)
            .background(Color.clear)
        }
        .frame(width: 120, height: 240)
    }
}

struct NewsItemCard: View {
    var title: String
    var subtitle: String
    var imageName: String? = nil
    // 顯示左下角來源膠囊（例：ent.ltn.com.tw）
    var domain: String? = nil
    // 可調整尺寸，預設貼近截圖比例
    var width: CGFloat = 400
    var height: CGFloat = 110
    var showMore: Bool = false
    // 新增：控制是否顯示上方大標題與「更多 >」
    var showHeader: Bool = true
    // 新增：大標題內容（可選）
    var bigtitle: String? = nil
    
    var body: some View {
        if showHeader {
            HStack {
                if let bigtitle {
                    Text(bigtitle)
                        .font(.system(size: 22))
                        .padding(.top,10)
                }
                
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
        }
        
        ZStack {
            // 背景卡片
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 24/255, green: 24/255, blue: 24/255))
                .frame(width: width, height: height)

            // 內容：左圖右文
            HStack(spacing: 12) {
                // 左側圖片，附來源膠囊
                ZStack(alignment: .bottomLeading) {
                    if let imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: height - 20)
                            .clipped()
                            .cornerRadius(12)
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 150, height: height - 30)
                    }

                    if let domain {
                        HStack(spacing: 6) {
                            Text(domain)
                                .font(.caption.bold())
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.black.opacity(0.55))
                        .clipShape(Capsule())
                        .padding(8)
                    }
                }

                // 右側文字
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    Text(subtitle)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .lineLimit(1)

                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,13)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
        }
    }
}

struct SocialCard: View {
    // Header
    var avatarImageName: String? = nil
    var displayName: String
    var timestamp: String
    
    // Content
    var headlinePrefixSymbol: String = "headphones"
    var headlineText: String
    var contentText: String
    var showMoreButton: Bool = true
    
    // Embedded episode
    var embedImageName: String? = nil
    var embedTitle: String
    var embedDuration: String
    
    // Reactions
    var likeCount: Int
    var commentCount: Int
    
    // 與 NewsItemCard 相同：可調整寬度（預設 400）
    var width: CGFloat = 400
    
    // 新增：是否顯示上方標題（預設不顯示），標題文字預設「社群動態」
    var showHeader: Bool = false
    var headerTitle: String = "社群動態"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if showHeader {
                HStack {
                    Text(headerTitle)
                        .font(.system(size: 22))
                        .padding(.vertical,15)
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                // Header
                HStack(alignment: .top, spacing: 12) {
                    avatarView
                    VStack(alignment: .leading, spacing: 4) {
                        Text(displayName)
                            .font(.system(size: 18).bold())
                            .foregroundColor(.white)
                        Text(timestamp)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                
                // Headline
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Image(systemName: headlinePrefixSymbol)
                        .foregroundColor(.white)
                    Text(headlineText)
                        .font(.system(size: 18).bold())
                        .foregroundColor(.white)
                        .lineLimit(2)
                }
                
                // Content + more
                VStack(alignment: .leading, spacing: 6) {
                    Text(contentText)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .lineLimit(3)
                    if showMoreButton {
                        Button("......更多") {}
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                }
                
                // Embedded episode card
                embeddedEpisode
                
                // Reaction summary (likes left / comments right)
                HStack {
                    HStack(spacing: 6) {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 20, height: 20)
                            Image(systemName: "hand.thumbsup.fill")
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                        }
                        Text("\(likeCount)")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("\(commentCount) 則留言")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
                
                Divider().overlay(Color.white).padding(.horizontal, -8)
                
                // Action row
                HStack {
                    actionItem(system: "hand.thumbsup", title: "讚")
                    actionItem(system: "text.bubble", title: "留言")
                    actionItem(system: "arrowshape.turn.up.right", title: "分享")
                }
                .padding(.vertical, 2)
            }
            .padding(16)
            .frame(width: width, alignment: .leading) // 固定寬度，與 NewsItemCard 一致
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color(red: 41/255, green: 41/255, blue: 41/255))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.white, lineWidth: 1) // 純白色邊框線
            )
        }
    }
    
    // MARK: - Subviews
    
    private var avatarView: some View {
        Group {
            if let name = avatarImageName {
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())
            } else {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                    Image(systemName: "music.note")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
                .frame(width: 42, height: 42)
            }
        }
    }
    
    private var embeddedEpisode: some View {
        HStack(spacing: 12) {
            if let embedImageName {
                Image(embedImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 64, height: 64)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(embedTitle)
                    .font(.system(size: 16).bold())
                    .foregroundColor(.white)
                    .lineLimit(2)
                Text(embedDuration)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: 33/255, green: 33/255, blue: 33/255))
        )
    }
    
    private func actionItem(system: String, title: String) -> some View {
        Button {
            // TODO: 動作
        } label: {
            HStack(spacing: 6) {
                Image(systemName: system)
                Text(title)
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
        .buttonStyle(.plain)
    }
}
