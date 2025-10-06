# MusicAppHomePage SwiftUI Demo

這是一個用 SwiftUI 製作的「音樂與聲音節目」首頁範例。畫面結合了音樂推薦、排行榜、Podcast、新聞、社群卡片等模組，採用現代化的卡片式設計，展示多元的媒體內容。

## 主要特色

- 🎵 音樂推薦、最近播放、排行榜、本週精選、最新發行等多種音樂卡片
- 🎤 Podcast 推薦、語文節目、地理節目等分類
- 📰 新聞卡片
- 👥 社群動態卡片，支援 Like/Comment 數與嵌入內容
- 📱 固定底部標籤列 (TabBar)
- 🌙 預設全螢幕深色模式

## 技術棧

- Swift 5.9+
- SwiftUI
- 適用於 iOS/iPadOS/macOS (Universal SwiftUI code)

## 檔案說明

- `ContentView.swift`：App 入口與主頁面組件
- 其餘元件如 `MusicRowView`、`MusicItemCard`、`PodcastItemCard`、`FollowItemCard`、`MusicChartsView`、`NewsItemCard`、`SocialCard`、`BottomTabBarView`…請參考元件定義

## 如何執行

1. 使用 Xcode 15+ 打開本專案
2. 選擇模擬器或你的設備，執行 (⌘R)。
3. 可直接於 SwiftUI Preview 查看主畫面效果。
