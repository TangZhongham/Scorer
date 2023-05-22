#  Scorer log

## 功能列表

羽毛球记分（乒乓球
读取iOS 的
生成图片分享到 wechat
支持记录卡路里等 也输出

蓝牙配对？要找一个方式配对两个人的watch。也可以单人记分模式。

✅ 看看市面上有没有类似app。

✅ 画草图做初版app

timer 可参考：https://github.com/sunshaped/watchOS-zen-timer/blob/main/ZenTimer%20WatchKit%20Extension/ContentView.swift

可以最后polish 的时候再弄 animatino / transition

iOS 上的 user setting 页面可以用 UserDefaults 的字典去persist  ：https://www.simpleswiftguide.com/how-to-use-userdefaults-in-swiftui/

persisit data 参考：https://developer.apple.com/tutorials/app-dev-training/persisting-data

rotation 发现使用 ignoresafearea 的情况下rotate 后塞不满屏幕，文字位置肯定也不对，笨方法就是直接重写一个其他方向版本的View咯。

wwdc 做一个workout app 涉及 healthkit：https://developer.apple.com/videos/play/wwdc2021/10009/。https://app-o-mat.com/article-series/watchkit-workout-apps

内购是可以不用server 端验证的，可以加内购解锁 player 功能，可添加照片，记录play 次数。IAP 实现可以问问chatgpt 写例子

❎ 配色参考：https://developer.apple.com/tutorials/app-dev-training/creating-a-card-view。https://developer.apple.com/tutorials/app-dev-training/passing-data-with-bindings

## 开发记录

Haptic: 
自己用的是：Direction Up, Success, 取消是：Failure. https://developer.apple.com/documentation/watchkit/wkhaptictype

目标项目用的haptic 是 加分：Success 。双击取消：Retry，长按只有震动，应该是 click .https://developer.apple.com/documentation/watchkit/wkhaptictype

Pop to root view 使用：https://stackoverflow.com/questions/62207710/swiftui-how-can-i-pop-to-the-root-view-for-watchos 注释掉.isDetailLink(false)

暂时没使用 NavigationStack 是因为 build 后部分全屏显示的被取消了，可能是苹果bug，所以全局暂时用 navigationlink 路由。

animation + transition: https://swiftui-lab.com/advanced-transitions/

数字可参考实现点击震动效果：https://benoitpasquier.com/create-watchos-app-in-swiftui/

## 日期记录

0517:

参考：https://developer.apple.com/videos/play/wwdc2022/10133/

去进行app 的开发。


0518

设计基本程序，页面流转，简单+- 记分功能。

https://stackoverflow.com/questions/58539015/swiftui-respond-to-tap-and-double-tap-with-different-actions

✅ 根据链接添加了 单击 +1 双击 -1 的功能。

https://developer.apple.com/documentation/swiftui/longpressgesture

✅ 添加 longpress 功能。

✅ 添加 sound 功能

今晚or 明天：背后数据结构，先搞简单的计数，然后震动。然后写一个 网球的？

0519

✅ 完成 haptic 设计。考虑背后数据结构。

卡在了 从 view2 弹到 主view 这个操作上面，看到一种实现，但是 watchos 不支持 .isDetailLink(false) :https://thinkdiff.net/swiftui-how-to-pop-to-root-view-e27fa0dc8fa8

结果发现另一个帖子说 只要注释掉那一行照样 work 。。。 客户端开发就是这点蛋疼，苹果说了算。https://stackoverflow.com/questions/62207710/swiftui-how-can-i-pop-to-the-root-view-for-watchos

✅ 完成 从第三页向首页回归。pop to root view

✅ 之前上下两个颜色中间有条线，其实只要在 父VStack 加上 spacing:0 就可以了

🏄🏄🏄🏄 app 设计：

当前基本的计数功能开发完毕，差一个背后数据结构，然后横向扩展其他功能，计时器，比分计算，羽毛球，乒乓球，网球（难）。

总体功能：颜色可shuffle，支持切换中英文两种语言； 支持按时间汇总画图，支持player（暂时不做），这两个功能可以结合手机添加 player 功能。支持对局生成图片分享。iOS app 开发

简单计分器：✅ 默认无计时，✅ 默认无限把，✅ 无局数，❎ 手动归零。

❎ 羽毛球计分器：默认正计时，默认一把 21 分，默认三局两胜，每局双方打到20平后，一方领先2分即算该局获胜；若双方打成29平后，一方领先1分，即算该局取胜。

❎ 乒乓球记分器：默认正计时，默认一把 11 分（可切换成21分），默认三局两胜（三局两胜、五局三胜、七局四胜三种）。到10-10 时需要等到 超2 才算胜利。 

❎ 支持自定义记分器：

❎ ~~游泳计时器：输入圈数，总时间~~，

0519 碰见的bug 可能是目前还是通过 struct 去构造，后期改成 observableobject 可能就OK了。

0520 没管bug，先把核心功能写了出来。

✅ 完成timer，写死的记分，记局功能。
✅ 完成两个方向的rotation 功能
✅ 完成之前首页的bug～不是bug，是自己写呲了～

0521 调研 手表和iphone 之间数据同步怎么玩。调研画图，可以先放在iOS。 调研内购（画图，创建player 玩家），结合首页作成可配置化可添加、删除化。

An independent watchOS app can use Watch Connectivity to transfer information from its companion iOS app when the iOS device is available. However, the independent watchOS app can’t use Watch Connectivity as its main source of data, so it needs to be capable of accessing information on its own.
https://developer.apple.com/documentation/watchconnectivity

✅ 参考这篇文章的demo 成功了：https://cgaaf.medium.com/swiftui-watch-connectivity-in-4-steps-594f90f3a0bc

先搞一个最简app，就是 iphone，watch 两边的可以同时操作，先砍掉其他页面。watch 两个页面，记分器，设置；iphone 两个页面，记分器，设置。

明天or今晚把后台写死的换成observableobject 给两边用

✅ 完成背后数据结构替换成 observableobject 。
~~❎ 由于使用stack 引入 1. detail 有一个大横条，canvas 没有simulator有 2. 没写返回root view的方案。（Yea so it got fixed when I did .navigationBarHidden(true) and ran it in a simulator and on my apple watch, but the canvas was glitched into still showing the navigation bar. Thank you for the help! 跟我的不一样。但是真有可能是显示的bug，暂时先不管？https://www.reddit.com/r/SwiftUI/comments/k0guf4/watchos_series_5_44mm_safe_area_problem/）~~
晚上12点半发现还是自己的锅，太sloppy了，明天记录一下整个过程。前端真的不像后端那么自由，bug太难找了。

工具页布局可参考：https://stackoverflow.com/questions/60779781/swiftui-is-not-respecting-safe-area-for-apple-watch

0522 pop to root view 问题：https://stackoverflow.com/questions/73723771/navigationstack-not-affected-by-environmentobject-changes/

✅ 解决大横条“bug” 问题

0522 ✅ 解决回root view 的问题。

## 学习心得

0521 原本board 类设置成struct 且非Observable Object 同时 View 里面用Binding 只提供了 展示功能，没有留 tap +1 功能。根本原因是开发还不熟悉。于是大改成了 Observable Object。
同时 发现 Observed Object 总是要塞变量 View(model:a) 于是改成了 environmentObject 。好处是 call view 的时候只需要 View.environmentObject(xx)


## BUG 记录

~~0519 发现一个 swiftui 的bug，具体是希望用 foreach + if 判断一下 a.name == "b" 的情况，会出现实际绑定无法预知的情形。暂时绕过~~

~~0520 发现绑定了 observableobject 的版本也有bug。~~

~~有可能1 workout 没有UUID？
2. 参考这个人好像碰见一样的问题，发现确实和 isActive 有关：https://www.hackingwithswift.com/forums/swiftui/navigationlink-in-list-pushes-the-wrong-row/5213

isactive 是为了pop to rootview 实现的，有空试试这种方式 pop：~~\https://www.hackingwithswift.com/forums/swiftui/pop-to-parent-view-via-bar-button/1295\~~

要么先不玩pop to root view

✅ ps: 这个bug 是参考这个链接引入的，可能作者只用了一个view （实在不行我也可以只实现一层，就是单个记分器，只不过可以不断修改，也是一种方案。

✅ 发现我的问题是 isActive 的变量 多个view 都用了，造成了混乱。https://app-o-mat.com/article/watchkit/programmatic-navigationlink-swiftui-apple-watch

✅ 不是bug，自己写错了，通过以上链接里的方法传一个 () -> void 给子view render 的同时执行，解决了这个问题。

```swift
            ForEach(workouts) { workout in
                //                WorkoutCellView(workout: workout)
                // 这里可以通过 destination 传 workout 给下层view 做一个switch 判断给到哪个view。
                Group {
                    if workout.name == "简单计分板" {
                        NavigationLink(destination: BadmintonView().environmentObject(appState)
                            .transition(.asymmetric(insertion: .opacity, removal: .scale))
                                       
                                       //                    .transition(.opacity)
                                       //                    .animation(.easeIn)
                                       , isActive: $appState.moveToRoot) {
                            WorkoutCellView(workout: workout).environmentObject(appState)
                        }
                        
                    } else if workout.name != "简单计分板" {
                        NavigationLink(destination: Text("Still working on it...")
                            .transition(.asymmetric(insertion: .opacity, removal: .scale))
                                       
                                       //                    .transition(.opacity)
                                       //                    .animation(.easeIn)
                                       , isActive: $appState.moveToRoot) {
                            WorkoutCellView(workout: workout).environmentObject(appState)
                        }
                        
                    }
                }}
```
