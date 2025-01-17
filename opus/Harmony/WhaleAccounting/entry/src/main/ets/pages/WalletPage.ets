import { router } from '@kit.ArkUI';
interface UserAccount {
  id: number,
  date: string,
  icon: string,
  title: string,
  price: number,
  dsc: string,
  token:string
}

@Entry
@Component
struct WalletPage {
  @State price: string = '0.00';
  @State isHide: boolean = false;


  @StorageLink('userAccount') userAccount:UserAccount[] =[]
  @StorageLink('Token') token:string = ''
  @State list:UserAccount[] = this.userAccount.filter(item =>{
    return item.token == this.token
  })

  @State income: number = this.list.reduce((accumulator, item) => {
    let inmoney = 0;
    if (item.price > 0) {
      inmoney = item.price;
    }
    return accumulator + inmoney;
  }, 0); // 初始值为0
  @State outcome: number = this.list.reduce((accumulator, item) => {
    let outmoney = 0;
    if (item.price < 0) {
      outmoney = item.price;
    }
    return accumulator + outmoney;
  }, 0); // 初始值为0
  @State allmoney: number = this.income + this.outcome




  build() {
    Column() {
      // 头部
      Row() {
        Image('icon/backbuttom.png')
          .width(24)
          .height(16)
          .onClick(() => {
            router.back()
          })
        Row() {
          Text("账本")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor("#459a7f")
        }
        .width("60%")
        .margin({
          left: 40
        })
      }
      .width("90%")
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({
        top: 12
      })

      // 资产
      Column() {
        Column() {
          Row() {
            Text("净资产")
              .fontSize(18)
              .fontWeight(600)
              .fontColor("#73806e")
          }
          .width("90%")
          .margin(12)

          Row() {
            Text(this.isHide?"******":this.allmoney.toFixed(2)+'￥')
              .fontSize(22)
              .fontColor("#4b987d")
              .fontWeight(600)
            Text(this.isHide?"显示":"隐藏")
              .fontSize(16)
              .fontColor("#4b987d")
              .onClick(()=>{
                this.isHide = !this.isHide
              })
          }
          .width("90%")
          .margin(12)
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .backgroundColor("#f2ffed")
        .padding({bottom:20})

        Row()
          .width("90%")
          .borderStyle(BorderStyle.Dashed)
          .margin({ bottom:20 })
          .borderWidth(1)
          .borderColor("#ccc")
        Row() {
          Text("总资产")
            .fontSize(14)
            .fontColor("#b5b4af")
          Text(this.income.toFixed(2)+'￥')
            .fontSize(14)
            .fontColor("#b5b4af")
        }
        .width("90%")
        .margin(12)
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Text("总负债")
            .fontSize(14)
            .fontColor("#b5b4af")
          Text(this.outcome.toFixed(2)+'￥')
            .fontSize(14)
            .fontColor("#b5b4af")
        }
        .width("90%")
        .margin(12)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width("90%")
      .backgroundColor("#fefdf8")
      .borderWidth(4)
      .borderColor("#89d9b9")
      .borderRadius(20)
      .margin(40)
      .padding({
        bottom:10
      })
    }
    .height('100%')
    .width('100%')
    .linearGradient({
      // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
      colors: [
        ["#d2fdcd", 0.0], // 颜色断点1的颜色和比重，对应组件在180°方向上的起始位置
        ["#fff", 1.0], // 颜色断点2的颜色和比重，对应组件在180°方向上的终点位置
      ]
    })
    .alignItems(HorizontalAlign.Center)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}