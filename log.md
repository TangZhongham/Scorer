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


## BUG 记录

0519 发现一个 swiftui 的bug，具体是希望用 foreach + if 判断一下 a.name == "b" 的情况，会出现实际绑定无法预知的情形。暂时绕过

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
