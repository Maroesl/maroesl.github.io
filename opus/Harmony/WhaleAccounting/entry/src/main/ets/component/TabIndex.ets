import router from '@ohos.router';

interface top_tab {
  icon: string,
  title: string
}

@Component
struct TabIndex {
  @State iconList: top_tab[] = [
    { icon: 'icon/jinriximing.webp', title: '今日细明' },
    { icon: 'icon/qianbao.webp', title: '钱包' },
    { icon: 'icon/yusuan.webp', title: '预算' },
    { icon: 'icon/rili.webp', title: '日历' },
    { icon: 'icon/fuli.webp', title: '福利' },
  ]

  build() {
    // tab
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        // 主体内容
        ForEach(this.iconList, (item: top_tab) => {
          ListItem() {
            Column() {
              Image(item.icon)
                .width(30)
                .height(30)
              Text(item.title)
                .margin({ top: 6 })
                .fontSize(12)
                .fontWeight(600)
                .fontColor('#ff73ac87')
                .textAlign(TextAlign.Center)
            }.onClick(() => {
              if (item.title === '今日细明') {
                router.pushUrl({ url: 'pages/Today' })
              } else if (item.title === '钱包') {
                router.pushUrl({ url: 'pages/WalletPage' })
              } else {
                return
              }
            })
          }
        }, (item: top_tab) => item.title)
      }
    }
    .padding(10)
    .backgroundColor('#fff')
    .borderRadius(20)
    .margin({ top: 10 })
    .borderWidth(3)
    .borderStyle(BorderStyle.Solid)
    .borderColor('#e9efe6')

  }
}

export default TabIndex;