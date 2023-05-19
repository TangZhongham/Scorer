#  Scorer log

## 功能列表

羽毛球记分（乒乓球
读取iOS 的
生成图片分享到 wechat
支持记录卡路里等 也输出

蓝牙配对？要找一个方式配对两个人的watch。也可以单人记分模式。

看看市面上有没有类似app。

画草图做初版app

timer 可参考：https://github.com/sunshaped/watchOS-zen-timer/blob/main/ZenTimer%20WatchKit%20Extension/ContentView.swift

可以最后polish 的时候再弄 animatino / transition

## 开发记录

Haptic: 
自己用的是：Direction Up, Success, 取消是：Failure. https://developer.apple.com/documentation/watchkit/wkhaptictype

目标项目用的haptic 是 加分：Success 。双击取消：Retry，长按只有震动，应该是 click .https://developer.apple.com/documentation/watchkit/wkhaptictype

Pop to root view 使用：https://stackoverflow.com/questions/62207710/swiftui-how-can-i-pop-to-the-root-view-for-watchos 注释掉.isDetailLink(false)

暂时没使用 NavigationStack 是因为 build 后部分全屏显示的被取消了，可能是苹果bug，所以全局暂时用 navigationlink 路由。

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
