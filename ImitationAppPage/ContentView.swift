import SwiftUI

// 主 View - 模仿 App 主頁面
struct MusicAppHomePageView: View {
    
    private let sectionSpacing: CGFloat = 10
    
    var body: some View {
        ZStack { // ZStack 作為根元件，用於固定底部標籤列
            // 主要內容區塊 (可捲動)
            ScrollView { // ScrollView 實現畫面上下捲動
                VStack(alignment: .leading, spacing: 0) { // 最外層 VStack
                    
                    // 1. 頂部導航列
                    TopBarView()
                    
                    // 2. 促銷橫幅
                    PromoBannerView()
                    
                    // 3. 最近播放紀錄（唯一緊貼上方）
                    MusicRowView(
                        items: [
                            MusicItemCard(title: "音樂播放紀錄", subtitle: "", isHistory: true),
                            MusicItemCard(title: "合輯 - STACEY - Worst Part", subtitle: "MIXERBOX", imageName: "stacey", isHistoryList: true),
                            MusicItemCard(title: "合輯 - Dark   Paradise", subtitle: "MIXERBOX", imageName: "lana", isHistoryList: true),
                            MusicItemCard(title: "mine - Melanie Unger -  Crazy Glue", subtitle: "吳慧金", imageName: "glue", isHistoryList: true),
                            MusicItemCard(title: "mine －告五人Accusivefire [唯一] Official Music Video", subtitle: "吳慧金", imageName: "only", isHistoryList: true),
                            MusicItemCard(title: "合輯 - 汪峰 - 光明", subtitle: "MIXERBOX", imageName: "wind", isHistoryList: true),
                            MusicItemCard(title: "合輯 - Panic! At The Disco – House of Memories [Lyrics/Vietsub]", subtitle: "MIXERBOX", imageName: "house", isHistoryList: true),
                            MusicItemCard(title: "mine - 聲樂", subtitle: "吳慧金", imageName: "snow", isHistoryList: true),
                            MusicItemCard(title: "合輯 - 東城衛-089BI(流氓蛋糕店插曲)(血聯幫幫歌)", subtitle: "MIXERBOX", imageName: "blood", isHistoryList: true),
                            MusicItemCard(title: "合輯 - 艾力克斯華倫 Alex Warren - Ordinary 非凡之愛 (華納官方中字版)", subtitle: "MIXERBOX", imageName: "ordinary", isHistoryList: true),
                            MusicItemCard(title: "合輯 - Zendaya - Neverland (From Finding Neverland The Album – Official Video)", subtitle: "MIXERBOX", imageName: "neverland", isHistoryList: true),
                            MusicItemCard(title: "合輯 - What It Sounds Like | Official Song Clip | KPop Demon Hunters", subtitle: "MIXERBOX", imageName: "sound", isHistoryList: true)
                        ],
                        showMore: false,
                        topPadding: 0,// 讓「最近播放紀錄」緊貼上方 Banner
                        useGradientBackground: true
                    ) {
                        HStack(spacing: 6) {
                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                                .foregroundColor(.blue)
                            Text("最近播放紀錄")
                        }
                    }
                    
                    // 4. 推薦給你的音樂（統一間距）
                    MusicRowView(
                        items: [
                            MusicItemCard(title: "2000 千禧年代華語金曲精選", subtitle: "吳慧金", imageName: "golden"),
                            MusicItemCard(title: "合輯 - Alex Warren - Eternity", subtitle: "MIXERBOX", imageName: "eternity"),
                            MusicItemCard(title: "合輯 - 張傑 - 他不懂你", subtitle: "MIXERBOX", imageName: "know"),
                            MusicItemCard(title: "合輯 - New Releases", subtitle: "MIXERBOX", imageName: "whatever"),
                            MusicItemCard(title: "合輯 - ⛤《星光繼承者》If only - Descendants 中文字幕 (Dove Cameron)", subtitle: "MIXERBOX", imageName: "ifonly"),
                            MusicItemCard(title: "合輯 - Katy Perry - Unconditionally (Official)", subtitle: "MIXERBOX", imageName: "woke"),
                            MusicItemCard(title: "合輯 - T.I. - Dead & Gone ft. Justin...", subtitle: "MIXERBOX", imageName: "dead"),
                            MusicItemCard(title: "合輯 - 華語流行音樂", subtitle: "吳慧金", imageName: "china"),
                            MusicItemCard(title: "合輯 - 冷門福利#10 〓 The Girl That's Underneath 《面具下的女孩》", subtitle: "MIXERBOX", imageName: "girl"),
                        ],
                        showMore: true,
                        topPadding: sectionSpacing
                    ) {
                        Text("推薦給你的音樂")
                    }
                    
                    // 5. 大家都在聽（統一間距）
                    MusicRowView(
                        items: [
                            PodcastItemCard(title: "小王子EP3小王子與玫瑰花", subtitle: "吉普賽詩人彼得潘", imageName: "prince"),
                            PodcastItemCard(title: "EP278 【高中地科】如何借東風", subtitle: "諸葛孔暗", imageName: "geo"),
                            PodcastItemCard(title: "EP444 靈異電梯事件簿：十八層的秘密", subtitle: "孟婆小姐今年18", imageName: "ghost"),
                            PodcastItemCard(title: "愛在R&B：你是我的藍調故事", subtitle: "情歌小王子", imageName: "sing"),
                            PodcastItemCard(title: "我即將征服的第99個魚塘", subtitle: "不是美國人海明威", imageName: "sharp"),
                            PodcastItemCard(title: "[EP01]關於我跟柳如眉跟王媽", subtitle: "霸總007", imageName: "money"),
                            PodcastItemCard(title: "倫敦橋行動代號-ep74", subtitle: "伊麗莎白要當女王", imageName: "gueen"),
                            PodcastItemCard(title: "歷史檔案：其實我不愛吃橘子", subtitle: "鐵路警察朱自清", imageName: "orange"),
                            PodcastItemCard(title: "調查局EP28-可口可樂永遠滴神", subtitle: "百事可樂頭號股東", imageName: "coke"),
                            PodcastItemCard(title: "邱比特大鬧月老廟：愛情使人盲目", subtitle: "月老（退休中）", imageName: "lovegod"),
                            PodcastItemCard(title: "兒童教育：身教遠比言教有用", subtitle: "略通拳腳孔夫子", imageName: "teacher"),
                            PodcastItemCard(title: "紅樓解密E81-林黛玉為何那樣", subtitle: "絳珠仙子", imageName: "red")
                        ],
                        showMore: true,
                        height: 250,
                        topPadding: sectionSpacing
                    ) {
                        Text("大家都在聽")
                    }
                     
                    // 6. 編輯推薦：曲風 & 情境（統一間距）
                    MusicRowView(
                        items: [
                            MusicItemCard(title: "愛在R&B", subtitle: "", imageName: "randb"),
                            MusicItemCard(title: "學習時聽的爵士樂", subtitle: "", imageName: "studysong"),
                            MusicItemCard(title: "華語舞曲派對大合輯", subtitle: "", imageName: "partysong"),
                            MusicItemCard(title: "電音新曲快遞", subtitle: "", imageName: "elec"),
                            MusicItemCard(title: "70年代流行搖滾金曲", subtitle: "", imageName: "rock70"),
                            MusicItemCard(title: "香港高能量樂曲合輯", subtitle: "", imageName: "beyond"),
                            MusicItemCard(title: "Feel Good! 韓流跳舞歌", subtitle: "", imageName: "goldensong"),
                            MusicItemCard(title: "鄉村合唱歌", subtitle: "", imageName: "taylor"),
                            MusicItemCard(title: "復古搖滾節奏", subtitle: "", imageName: "rock")
                        ],
                        showMore: true,
                        topPadding: 10
                    ) {
                        Text("編輯推薦：曲風 & 情境")
                    }
                     
                    // 7. 音樂熱門排行榜（統一間距，移除內部 vertical padding）
                    MusicChartsView(
                        header: {
                            HStack(spacing: 6) {
                                Image(systemName: "flame.fill")
                                    .foregroundColor(.red)
                                    .padding(.top, 2) // 微調跟文字的對齊
                                Text("音樂熱門排行榜")
                            }
                        },
                        groups: [
                            [("001", "華語本周熱門", ""),
                             ("002", "最新熱門單曲", ""),
                             ("003", "西洋本周熱門", ""),
                             ("004", "西洋最新熱門單曲", ""),
                             ("005", "韓語本周熱門", "")],
                            [("006", "日語本周熱門", ""),
                             ("007", "美國告示牌排行", ""),
                             ("008", "iTunes熱門排行", ""),
                             ("009", "英國最新熱門單曲", "")]
                        ],
                        itemTextWidth: 180,
                        sectionHeight: 350
                    )
                    .padding(.top, sectionSpacing)
                    
                    // 8. 本週精選音樂（統一間距）
                    MusicRowView(
                        items: [
                            MusicItemCard(title: "心之火－飛兒樂團F.I.R & 彭佳慧Julia Peng", subtitle: "", imageName: "018", isweekitem: true, weeknum: "8"),
                            MusicItemCard(title: "Halsey - Colors (Official Music Video)", subtitle: "", imageName: "014"),
                            MusicItemCard(title: "Sarah Jeffery Queen of Mean", subtitle: "", imageName: "030", isweekitem: true, weeknum: "14"),
                            MusicItemCard(title: "Empire State of Mine", subtitle: "", imageName: "023", isweekitem: true, weeknum: "15"),
                            MusicItemCard(title: "「嚴厲的愛 Tough Love」惡棍巢穴", subtitle: "", imageName: "031", isweekitem: true, weeknum: "4"),
                            MusicItemCard(title: "讓酒-摩登兄弟劉宇寧", subtitle: "", imageName: "013"),
                            MusicItemCard(title: "好想愛這個世界啊 華晨宇", subtitle: "", imageName: "019"),
                            MusicItemCard(title: "《Fuckin' Perfect》- P!nk", subtitle: "", imageName: "020"),
                            MusicItemCard(title: "Maroon 5 - Payphone ft. Wiz Khalifa", subtitle: "", imageName: "021", isweekitem: true, weeknum: "5"),
                            MusicItemCard(title: "楊千嬅 Miriam Yeung -《處處吻》", subtitle: "", imageName: "022")
                        ],
                        showMore: true,
                        topPadding: 10
                    ) {
                        Text("本週精選音樂")
                    }
                    
                    // 9. 音樂最新發行
                    MusicRowView(
                        items: [
                            MusicItemCard(title: "This Love", subtitle: "TAYLOR SWIFT", imageName: "035", isweekitem: true, weeknum: "29"),
                            MusicItemCard(title: "Hero", subtitle: "MARIAH CAREY", imageName: "041", isweekitem: true, weeknum: "1"),
                            MusicItemCard(title: "愛にできることはまだあるかい", subtitle: "RADWIMPS", imageName: "032"),
                            MusicItemCard(title: "What Was I Made For?", subtitle: "BILLIE EILISH", imageName: "039", isweekitem: true, weeknum: "3"),
                            MusicItemCard(title: "GIVE LOVE", subtitle: "樂童音樂家(AKMU)", imageName: "033"),
                            MusicItemCard(title: "BORN TO DIE", subtitle: "LANA DEL REY", imageName: "040"),
                            MusicItemCard(title: "與其愛你 Love Yourself", subtitle: "VH (Vast & Hazy)", imageName: "034"),
                            MusicItemCard(title: "heaven(헤븐)", subtitle: "에일리 Ailee", imageName: "036"),
                            MusicItemCard(title: "Love wins all", subtitle: "IU (아이유)", imageName: "044", isweekitem: true, weeknum: "30"),
                            MusicItemCard(title: "The Sound of Silence", subtitle: "Simon & Garfunkel", imageName: "047")
                        ],
                        showMore: true,
                        topPadding: sectionSpacing
                    ) {
                        Text("音樂最新發行")
                    }
                    
                    // 10. 推薦給你的Podcast聲音節目
                    MusicRowView(
                        items: [
                            FollowItemCard(title: "【打一花】有一片草地", subtitle: "梅花", imageName: "p01"),
                            FollowItemCard(title: "【打一花】還有一片草地", subtitle: "野梅花", imageName: "p02"),
                            FollowItemCard(title: "【打一水果】來了一群羊", subtitle: "草莓", imageName: "p03"),
                            FollowItemCard(title: "【打一水果】來了一隻狼", subtitle: "（快）桃", imageName: "p05"),
                            FollowItemCard(title: "【打一水果】狼吃了羊", subtitle: "楊梅", imageName: "p04"),
                            FollowItemCard(title: "【打一海產】狼沒吃羊", subtitle: "狼蝦", imageName: "p06")
                        ],
                        showMore: true,
                        height: 300,
                        topPadding: sectionSpacing
                    ) {
                        Text("推薦給你的Podcast聲音節目")
                    }
                    
                    // 11. 音樂 聲音節目
                    MusicRowView(
                        items: [
                            FollowItemCard(title: "【無情對】三星白蘭地", subtitle: "五月黃梅天", imageName: "m01", isfollowed: true),
                            FollowItemCard(title: "【無情對】公門桃李爭榮日", subtitle: "法國荷蘭比利時", imageName: "m02"),
                            FollowItemCard(title: "【無情對】替如夫人洗腳", subtitle: "賜同進士出身", imageName: "m03"),
                            FollowItemCard(title: "【無情對】如是我聞", subtitle: "安非他命", imageName: "m04"),
                            FollowItemCard(title: "【無情對】那天有諾重千金", subtitle: "此地無銀三百兩", imageName: "m05"),
                            FollowItemCard(title: "【無情對】魑魅魍魎", subtitle: "餡餅餛飩", imageName: "m06"),
                            FollowItemCard(title: "【無情對】赤貧對烏有", subtitle: "水手對火腿", imageName: "m07"),
                            FollowItemCard(title: "【無情對】藉口對還嘴", subtitle: "木耳對花心", imageName: "m08")
                        ],
                        showMore: true,
                        height: 300,
                        topPadding: 10
                    ) {
                        Text("語文 聲音節目")
                    }
                    
                    // 12. 歷史 聲音節目
                    MusicRowView(
                        items: [
                            FollowItemCard(title: "【台南人】的紅血球", subtitle: "是甜的", imageName: "t01", isfollowed: true),
                            FollowItemCard(title: "【台南人】的白血球", subtitle: "甜甜的", imageName: "t02"),
                            FollowItemCard(title: "【台南人】的滷蛋", subtitle: "齁甜的", imageName: "t03"),
                            FollowItemCard(title: "【台南人】的坐騎", subtitle: "黏黏的", imageName: "t04"),
                            FollowItemCard(title: "【台南人】的冰塊", subtitle: "糖分超標～", imageName: "t05"),
                            FollowItemCard(title: "【台南人】的吳阿花", subtitle: "當然也超甜der", imageName: "t06")
                        ],
                        showMore: true,
                        height: 300,
                        topPadding: 10
                    ) {
                        Text("地理 聲音節目")
                    }
                    
                    // 13. 每日更新 為你精選
                    MusicChartsView(
                        header: {
                            Text("每日更新 為你精選")
                        },
                        groups: [
                            [("o01", "人生有三道：上坡道、下坡道和萬萬想不到", "哲學家派大星"),
                             ("o02", "失落就是，失去喜歡的東西，所以覺得很寂寞", "日本腳臭上班族"),
                             ("o03", "我們都生活在陰溝裡，但仍有人仰望星空", "王爾德")],
                            [("o04", "無論幸事還是憾事，過去了就只不過是往事", "十大必看電影賞析"),
                             ("o05", "很努力去做一件沒有意義的事，就是浪漫吧", "攝影王老師"),
                             ("o06", "要做馬中赤兔，不做人中呂布", "磚家說")],
                            [("o12", "人性：得了千錢想萬錢，當了皇帝想成仙", "秦始皇心理學"),
                             ("o08", "此時情緒此時天，無事小神仙", "梅雨霽"),
                             ("o09", "我分不清海和天，就像我分不清好人和壞人", "城南舊事")],
                            [("o10", "我知這塵世如露水般短暫，然而然而", "小林俳句"),
                             ("o11", "還有一種罪惡要小心：那就是善良之人的冷漠", "武裝牧師"),
                             ("o07", "日光之下，並無新事", "傳道者K")]
                        ],
                        itemTextWidth: 180,
                        sectionHeight: 200
                    )
                    .padding(.top, 10)
                    
                    
                    NewsItemCard(
                        title: "看完驚呆了！原來人體有這麼多秘密，最後一個你絕對想不到",
                        subtitle: "自由時報電子報・娛樂",
                        imageName: "f01",
                        domain: "ent.fake.com.tw",
                        showMore: true,
                        showHeader: true,
                        bigtitle: "最新新聞"
                    )
                    .padding(.top, 10)
                    
                    
                    NewsItemCard(
                        title: "驚爆內幕！科學家發現這個東西能讓癌症消失",
                        subtitle: "自由時報電子報・娛樂",
                        imageName: "f02",
                        domain: "ent.fake.com.tw",
                        showMore: false,
                        showHeader: false
                    )
                    
                    SocialCard(
                        avatarImageName: "girl",         // 可選
                        displayName: "EvaBox TW",
                        timestamp: "2023/9/4 下午4:43",
                        headlineText: "科技Podcast速推：神奇小金",
                        contentText: "本集資訊量非常大，iOS程式設計背後的辛酸史大揭秘，完整分享大家最在意的作業用時、技術難度與完成度，這集全揭秘",
                        embedImageName: "girl",     // 可選
                        embedTitle: "【小金認真聊 EP.2】關於我的熬夜編年史",
                        embedDuration: "時長：13:31:21",
                        likeCount: 666,
                        commentCount: 5,
                        width: 400,
                        showHeader: true // 顯示「社群動態」標題
                    )

                    SocialCard(
                        avatarImageName: "girl",         // 可選
                        displayName: "EvaBox TW",
                        timestamp: "2023/9/5 下午10:43",
                        headlineText: "休閒Podcast速推：神奇大金",
                        contentText: "神奇手機科技推出的第一款遊戲：JuConnect 熱烈上架中，新奇的玩法，絢麗的音效，遊戲測評中，你最想知道的配對玩法、速通攻略，通通都在Pocast",
                        embedImageName: "girl",     // 可選
                        embedTitle: "【大津不是空調 EP.1】十年磨一劍，神奇手機的遊戲究竟好不好玩",
                        embedDuration: "時長：02:11:01",
                        likeCount: 821,
                        commentCount: 26,
                        width: 400,
                        showHeader: false // 顯示「社群動態」標題
                    )
                    .padding(.top, 10)
                    SocialCard(
                        avatarImageName: "girl",         // 可選
                        displayName: "EvaBox TW",
                        timestamp: "2023/9/3 下午25:43",
                        headlineText: "教育Podcast速推：瀕死阿金",
                        contentText: "一線記者直擊教育現場：我們的體系到底出了什麼問題，華人教育的糟粕遺毒淺移默化中改變了什麼？為何不斷有新的哀歌響徹校園之中",
                        embedImageName: "girl",     // 可選
                        embedTitle: "【阿金通靈中 EP.44】女學生電腦前猝死，為何我們總是有這麼多的作業",
                        embedDuration: "時長：09:18:02",
                        likeCount: 5555,
                        commentCount: 4444,
                        width: 400,
                        showHeader: false // 顯示「社群動態」標題
                    )
                    .padding(.top, 10)
                    SocialCard(
                        avatarImageName: "girl",         // 可選
                        displayName: "EvaBox TW",
                        timestamp: "2023/9/2 下午2:17",
                        headlineText: "音樂Podcast速推：哼哼金金",
                        contentText: "華語英語日語韓語，我們的目標是星辰大海，今日推薦冷門好聽歌曲top100，點擊收聽哼哼金金傾情獻唱，愛歌私藏分享，請勿外流！！",
                        embedImageName: "girl",     // 可選
                        embedTitle: "【破鑼嗓子EP.7】關於上面有些是亂寫的，但還有很多本人愛歌，好聽！",
                        embedDuration: "時長：01:08:02",
                        likeCount: 715,
                        commentCount: 80,
                        width: 400,
                        showHeader: false // 顯示「社群動態」標題
                    )
                    .padding(.top, 10)
                    
                    // 底部填充物，確保內容不會被 BottomTabBar 遮擋
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 80)
                }
            }
            .background(Color.black.ignoresSafeArea()) // 深色背景延伸至安全區外
            .preferredColorScheme(.dark) // 設置為深色模式
            
            // 固定底部標籤列
            VStack {
                Spacer() // 將底部標籤列推到底部
                BottomTabBarView()
            }
            .edgesIgnoringSafeArea(.bottom) // 讓標籤列延伸至底部安全區
        }
        
    }
}

// App 的入口 View，統一名稱給 Scene 和 Preview 使用
struct ContentView: View {
    var body: some View {
        MusicAppHomePageView()
    }
}

// 預覽功能 (使用 #Preview 宏)
#Preview {
    ContentView()
}
