import router from '@ohos.router';

@Component
struct BottomIndex {
  // 引入账号的本地存储数据   -lxz
  @StorageLink('Token') Token: string = ""

  build() {
    Row() {

      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Column() {
          Image('icon/qianbao.webp').width(25).margin({bottom:5})
          Text('钱包').fontSize(10).fontWeight(600).fontColor('#388b6d')
        }.onClick(() => {
            router.pushUrl({ url: 'pages/WalletPage' })
        })

        Column() {
          Image('icon/jiahao.webp').width(60)
        }.position({ top: -20, left: '43%' }).onClick(() => {
          if (this.Token == '') {
            router.pushUrl({ url: 'pages/LoginPage' })
          } else {
            router.pushUrl({
              url:
              'pages/AccountingPage'
            }
            )
          }
        })

        Column() {
          Image('icon/wode.webp').width(30).margin({bottom:3})
          Text('我的').fontSize(10).fontWeight(600).fontColor('#388b6d')
        }.onClick(() => {
          // 判断进入“我的”还是"登录"  -lxz
          if (this.Token == "") {
            router.pushUrl({ url: 'pages/LoginPage' })

          } else {
            router.pushUrl({ url: 'pages/MePage' })


          }
        })
      }
    }.width('100%').backgroundColor('#72dcae').height(60)

  }
}

export default BottomIndex;