import SwiftUI

// 2. 促銷橫幅 (Promo Banner)
struct PromoBannerView: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) { // 將頁碼點放在底部
                TabView(selection: $currentPage) {
                    FirstBannerPageView()
                        .tag(0)
                    SecondBannerPageView()
                        .tag(1)
                    ThirdBannerPageView()
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 150)
                .background(Color(red: 41/255.0, green: 41/255.0, blue: 41/255.0))
                
                // 底部三個頁碼點放到灰色背景裡
                HStack(spacing: 6) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(currentPage == index ? Color.black : Color.gray)
                            .frame(width: 6, height: 6)
                    }
                }
                .padding(.bottom, 10) // 與底部保持一點空間
            }
        }
    }
}

struct FirstBannerPageView: View {
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Image("gift")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                ZStack {
                    // 白邊描字
                    Text("福利即將失效，立刻領取")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: 1, y: 1)
                    Text("福利即將失效，立刻領取")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: -1, y: -1)
                    Text("福利即將失效，立刻領取")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: -1, y: 1)
                    Text("福利即將失效，立刻領取")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: 1, y: -1)
                    
                    // 上層黑字
                    Text("福利即將失效，立刻領取")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                
                Button("領取") {}
                    .padding(.horizontal, 30)
                    .padding(.vertical, 6)
                    .background(Color(red: 227/255.0, green: 21/255.0, blue: 96/255.0))
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 2)
                    .stroke(Color(red: 227/255.0, green: 21/255.0, blue: 96/255.0), lineWidth: 3)
            )
            
            // 下方兩行小字保持原本黑字白邊，含粉色文字
            VStack(alignment: .leading, spacing: 4) {
                // 第一行含粉色「終身免費」
                ZStack {
                    HStack(spacing: 0) {
                        Text("價值199的好康大放送APP，現在領取即可")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        Text("終身免費")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    .offset(x: 1, y: 1)
                    
                    HStack(spacing: 0) {
                        Text("價值199的好康大放送APP，現在領取即可")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        Text("終身免費")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    .offset(x: -1, y: -1)
                    
                    HStack(spacing: 0) {
                        Text("價值199的好康大放送APP，現在領取即可")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        Text("終身免費")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    .offset(x: -1, y: 1)
                    
                    HStack(spacing: 0) {
                        Text("價值199的好康大放送APP，現在領取即可")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        Text("終身免費")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    .offset(x: 1, y: -1)
                    
                    HStack(spacing: 0) {
                        Text("價值199的好康大放送APP，現在領取即可")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                        Text("終身免費")
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 227/255.0, green: 21/255.0, blue: 96/255.0))
                    }
                }
                
                // 第二行黑字白邊
                ZStack {
                    Text("現在下載還有機會獲得超商、星巴克、Uber禮券")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .offset(x: 1, y: 1)
                    Text("現在下載還有機會獲得超商、星巴克、Uber禮券")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .offset(x: -1, y: -1)
                    Text("現在下載還有機會獲得超商、星巴克、Uber禮券")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .offset(x: -1, y: 1)
                    Text("現在下載還有機會獲得超商、星巴克、Uber禮券")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .offset(x: 1, y: -1)
                    
                    Text("現在下載還有機會獲得超商、星巴克、Uber禮券")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }
            }
        }
        .cornerRadius(5)
        .padding(.horizontal, 8)
        .padding(.vertical, 15)
    }
}

struct SecondBannerPageView: View {
    var body: some View {
        VStack {
            VStack(spacing: 0) { // 上下分割
                // 上半部分 - 灰色背景
                HStack{
                    ZStack {
                        // 黑字白邊，紅色標註「永久免費」
                        ZStack {
                            HStack(spacing: 0) {
                                Text("會員福利:") // 白邊
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("永久免費") // 白邊
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("使用價值199元的APP") // 白邊
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            .offset(x: 1, y: 1)
                            
                            HStack(spacing: 0) {
                                Text("會員福利:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("永久免費")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("使用價值199元的APP")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            .offset(x: -1, y: -1)
                            
                            HStack(spacing: 0) {
                                Text("會員福利:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("永久免費")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("使用價值199元的APP")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            .offset(x: -1, y: 1)
                            
                            HStack(spacing: 0) {
                                Text("會員福利:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("永久免費")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Text("使用價值199元的APP")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            .offset(x: 1, y: -1)
                            
                            // 上層文字
                            HStack(spacing: 0) {
                                Text("會員福利:")
                                    .foregroundColor(.black)
                                Text("永久免費")
                                    .foregroundColor(Color.red)
                                Text("使用價值199元的APP")
                                    .foregroundColor(.black)
                            }
                            .font(.system(size: 18))
                        }
                    }
                    
                    Image("page2icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .frame(height: 60) // 可依需求調整高度

                // 下半部分 - 灰白色背景
                ZStack{
                    Color(red: 156/255.0, green: 156/255.0, blue: 156/255.0)
                    HStack {
                        ZStack {
                            // 黑字白邊，紅色標註「永久免費」
                            ZStack {
                                HStack(spacing: 0) {
                                    Text("你的會員福利即將失效>>")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23))
                                }
                                .offset(x: 1, y: 1)
                                
                                HStack(spacing: 0) {
                                    Text("你的會員福利即將失效>>")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23))
                                }
                                .offset(x: -1, y: -1)
                                
                                HStack(spacing: 0) {
                                    Text("你的會員福利即將失效>>")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23))
                                }
                                .offset(x: -1, y: 1)
                                
                                HStack(spacing: 0) {
                                    Text("你的會員福利即將失效>>")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23))
                                }
                                .offset(x: 1, y: -1)
                                
                                // 上層文字
                                HStack(spacing: 0) {
                                    Text("你的會員福利即將失效>>")
                                        .foregroundColor(.black)
                                }
                                .font(.system(size: 23))
                            }
                        }
                        ZStack(alignment: .topTrailing) {
                            Button("領取") {}
                                .font(.system(size: 20))
                                .padding(.horizontal, 37)
                                .padding(.vertical, 7)
                                .background(Color(red: 254/255.0, green: 131/255.0, blue: 2/255.0))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .padding(.horizontal, 4)
                                
                            // 紅點徽章
                            Text("3") // 這裡改成你要顯示的數字
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 25, height: 25)
                                .background(Color(red: 200/255.0, green: 44/255.0, blue: 45/255.0))
                                .clipShape(Circle())
                                .offset(x: 3, y: -12) // 控制位置：往右上角移
                        }
                    }
                }
                .frame(height: 70) // 可依需求調整高度
                
            }
            .cornerRadius(10)
            .padding(.horizontal, 8) // 左右留白
            .padding(.vertical, 10)  // 上下留白
        }
        .background(Color(red: 41/255.0, green: 41/255.0, blue: 41/255.0)) // Banner 背景
    }
}

struct ThirdBannerPageView: View {
    var body: some View {
        ZStack {
            // 背景：漸變 + 雲朵
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 255/255.0, green: 151/255.0, blue: 145/255.0),
                    Color(red: 223/255.0, green: 224/255.0, blue: 91/255.0)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .overlay(alignment: .bottomLeading) {
                CloudCorner()
                    .foregroundColor(Color(red: 253/255.0, green: 215/255.0, blue: 174/255.0))
                    .frame(width: 100, height: 60)
                    .offset(x: -55, y: 30) // 貼齊左下角
            }
            .overlay(alignment: .topTrailing) {
                CloudCorner()
                    .foregroundColor(Color(red: 253/255.0, green: 234/255.0, blue: 199/255.0))
                    .frame(width: 100, height: 60)
                    .offset(x: 20, y: -20) // 貼齊右上角
            }
            .clipShape(RoundedRectangle(cornerRadius: 15)) // 裁掉超出的雲朵
            .frame(height: 130)

             // 2. 內容
             HStack(spacing: 0) { // HStack 佈局左側圖標區、中間文字、右側按鈕
                 // 左側：頭像氣泡
                 ZStack{
                     Image(systemName: "bubble.left.and.bubble.right")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 85)
                         .foregroundColor(.black)
                     Image(systemName: "bubble.left.and.bubble.right.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 82)
                     Image("檔案_012")
                         .resizable()
                         .frame(width: 55,height: 40)
                         .cornerRadius(10)
                         .offset(x:-10,y:-10)
                     Image("檔案_022")
                         .resizable()
                         .frame(width: 45,height: 35)
                         .cornerRadius(10)
                         .offset(x:15,y:0)
                 }
                 .offset(x:10)

                 // 中間：文字區塊
                 VStack(alignment: .leading, spacing: 0) { // VStack
                     ZStack {
                         // 小編推薦標題
                         Image("page3icon")
                             .resizable()
                             .scaledToFit()
                             .frame(width: 140,height: 90)
                            
                         HStack{
                             Image("title")
                                 .resizable()
                                 .scaledToFit()
                                 .frame(width: 70,height: 70)
                             Text("小編推薦")
                                 .foregroundColor(.white) // 文字顏色
                                 .font(.system(size: 14, weight: .bold))
                                 .padding(.leading,-13)
                         }
                         .padding(.top,-5)
                     }
                     .padding(.top,20)
                     // 冰友 (大字)
                     Text("冰友") // Text
                         .font(.system(size: 55, weight: .heavy))
                         .foregroundColor(.black)
                         .offset(x:25,y:-35)
                     // 好友地圖熱門 App
                     Text("好友地圖熱門App") // Text
                         .font(.system(size: 17, weight: .bold))
                         .foregroundColor(.black)
                         .offset(x:5,y:-35)
                 }
                 .padding(.leading, 10)
                 
                 Spacer()
                 
                 ZStack{
                     // 右側：按鈕
                     Button(action: {}) {
                         HStack {
                             Text("  限時免費下載")
                             Image(systemName: "play.fill")
                             Text("    ")
                         }
                     }
                     .font(.headline.bold())
                     .foregroundColor(.white)
                     .padding(.vertical, 15)
                     .padding(.leading,7)
                     .background(.white)
                     .cornerRadius(30) // 圓角膠囊按鈕
                     .padding(.trailing,-26)
                     .clipped() // 超出 Banner 的部分裁掉
                     .shadow(color: .pink,radius: 10,x: 1,y: 1)
                     
                     Button(action: {}) {
                         HStack {
                             Text("  限時免費下載")
                             Image(systemName: "play.fill")
                             Text("    ")
                         }
                     }
                     .font(.headline.bold())
                     .foregroundColor(.white)
                     .padding(.vertical, 12)
                     // 按鈕漸變色
                     .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 253/255.0, green: 70/255.0, blue: 110/255.0), // 紅色
                                Color(red: 255/255.0, green: 137/255.0, blue: 145/255.0)  // 粉色
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                     )
                     .cornerRadius(30) // 圓角膠囊按鈕
                     .padding(.trailing,-24)
                     .clipped() // 超出 Banner 的部分裁掉
                 }
             }
             // 模擬圖片中的白色亮點
             .overlay(alignment: .center) {
                 ZStack {
                     Image(systemName: "sparkles")
                         .foregroundColor(.white)
                         .font(.title)
                         .rotationEffect(.degrees(20))
                         .offset(x: 40, y: 10)
                     Image(systemName: "sparkles")
                         .foregroundColor(.white)
                         .font(.title)
                         .rotationEffect(.degrees(20))
                         .offset(x: -80, y: 10)
                 }
             }
         }
         .padding(.horizontal,10)
     }
}

struct CloudCorner: View {
    var body: some View {
        ZStack {
            // 疊幾個圓形當作雲朵
            Circle()
                .frame(width: 40, height: 40)
                .offset(x: -20, y: -20)
            Circle()
                .frame(width: 50, height: 50)
                .offset(x: 10, y: -25)
            Circle()
                .frame(width: 60, height: 60)
                .offset(x: 25, y: 5)
        }
        .frame(width: 200, height: 120)
        .clipped() // 裁掉超出矩形的部分
    }
}
