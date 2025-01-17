import DateIndex from '../component/DateIndex'
import TabIndex from '../component/TabIndex'
import MoneyIndex from '../component/MoneyIndex'
import BottomIndex from '../component/BottomIndex'
import OptionIndex from '../component/ListIndex'
import { router } from '@kit.ArkUI'
import { url } from '@kit.ArkTS'

interface Foption {
  id: number,
  icon: string,
  title: string,
  dsc: string,
  price: number,
  date: string,
}

interface UserAccount {
  id: number,
  date: string,
  icon: string,
  title: string,
  price: number,
  dsc: string
}

@Entry()
@Component
struct Index {
  @StorageLink('userAccount') list: UserAccount[] = []
  @State foption: Foption = {
    id: 0,
    icon: 'string',
    title: 'string',
    dsc: 'string',
    price: 0,
    date: 'string',
  }
  openY = () => {
    this.Y == "110%" ? this.Y = "0%" : this.Y = "110%"

  }
  // 增加筛选变量 -lxz
  @State filterMod: number = 0
  // 添加切换筛选效果
  @State flText: string = "筛选"

  @Styles
  opencss() {
    .margin({ top: 20 })
  }

  @Styles
  tab_top() {
    .width(40)
  }

  @Styles
  left_right(){
    .width(20)
    .borderStyle(BorderStyle.Solid)
    .borderWidth(2)
    .borderColor("#3b8a6b")
  }

  @State message: string = 'Hello World';
  @State num: string = '￥20.00';
  @State Y: string = "110%"

  build() {
    Column() {
      Row() {
        Column() {
          // title
          Row() {
            Text('Whale账本').fontSize(20).fontWeight(900).fontColor('#44826b')
          }

          // 日期
          DateIndex()
          // 金额
          MoneyIndex()
          // tab
          TabIndex()

          //  list_title
        }
      }.padding(10)

      Column() {
        Row() {
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            Row() {
              Text('收支记录').fontWeight(600).fontSize(20).position({ top: -12 })
              Row() {
              }.width(80)
            }.margin({ top: 15 }).height(15).backgroundColor('#faf5c7')


            Text() {
              ImageSpan('icon/shaixuan.png').width(14).margin({ right: 5, bottom: 2, left: 2 })
              Span(this.flText).fontWeight(600).fontColor('#ff518063').fontSize(14)
                .onClick(() => {
                  if (this.filterMod == 0) {

                    this.flText = "支出"
                    this.filterMod = 1
                  } else if (this.filterMod == 1) {

                    this.flText = "收入"
                    this.filterMod = 2

                  } else {

                    this.flText = "筛选"
                    this.filterMod = 0

                  }
                })


            }
            .textAlign(TextAlign.Center)
            .width(70)
            .backgroundColor('#a7f4ae')
            .borderRadius(30)
            .padding(5)
            .borderWidth(2)
            .borderColor('#81d1a0')
          }
        }.margin({ top: 10 }).padding({ left: 20, right: 20 })

        OptionIndex({ foption: this.foption, openY: this.openY, filterMod: this.filterMod }).height('100%')
      }.height('60%').backgroundColor('white').width('100%')

      Row() {
        BottomIndex()
      }.position({ bottom: 0 })

      // 弹出层

      Row() {
        Row() {
          Image('icon/back.png').width(20).position({ left: 0 }).onClick(() => {
            this.Y == "110%" ? this.Y = "0%" : this.Y = "110%"
          })
          Text('支出详情').position({ left: '36%' }).fontSize(20).fontColor('#57a588').fontWeight(600)
        }.width('100%').padding(20).position({ top: 20 })

        Row() {
          Column() {
            Row() {
              Image(`${this.foption.icon}`).width(40)
            }.padding(6).border({
              width: 3, color: '#78cca8'
            }).borderRadius('50%')
            .opencss()

            Row() {
              Text(`${this.foption.title}`).fontColor('#ff6b9f87').fontWeight(900).fontSize(20)
            }
            .opencss()

            Row() {
            }
            .borderWidth({ top: 5 })
            .borderStyle(BorderStyle.Dashed)
            .width('90%')
            .borderColor('#c8e3d6')
            .opencss()

            Row() {
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Column() {
                  Text('类型')
                }

                Column() {
                  if (this.foption.price > 0) {
                    Text(`收入`).fontColor('#8fc8ee').fontWeight(600)
                  } else {
                    Text(`支出`).fontColor('#f1958d').fontWeight(600)
                  }
                }
              }.padding(20)
            }.borderWidth({ bottom: 1 }).borderColor('#36999999')

            Row() {
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Column() {
                  Text('金额')
                }

                Column() {
                  if (this.foption.price > 0) {
                    Text(`+${this.foption.price}￥`).fontWeight(600)
                  } else {
                    Text(`${this.foption.price}￥`).fontWeight(600)
                  }
                }
              }.padding(20)
            }.borderWidth({ bottom: 1 }).borderColor('#36999999')

            //   time
            Row() {
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Column() {
                  Text('时间')
                }

                Column() {
                  Text(`${this.foption.date}`)
                }
              }.padding(20)
            }.borderWidth({ bottom: 1 }).borderColor('#36999999')

            //   备注
            Row() {
              Column() {
                Text('备注')
              }
            }.padding({ top: 30 })

            Row() {
              Flex() {
                if (this.foption.dsc) {
                  Text(`${this.foption.dsc}`).textAlign(TextAlign.Start)
                } else {
                  Text('暂无备注内容哟~').textAlign(TextAlign.Start)
                }
              }.width('100%')
            }
            .padding({
              top: 10,
              bottom: 10,
              left: 20,
              right: 20
            })
            .backgroundColor('#a8e5e5e5')
            .borderRadius(10)
            .margin(20)
          }
          .width('100%')
          .height('70%')
          .backgroundColor('#FFF')
          .borderRadius(20)
          .shadow({
            radius: 10,
            color: Color.Gray,
            offsetX: 20,
            offsetY: 20
          })

        }
        .padding(20)


        Row() {
          Flex({ alignItems: ItemAlign.Center }) {
            Text('删除')
              .backgroundColor('#fbefb3')
              .width('50%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .fontColor('#b5a96d')
              .fontWeight(700)
              .fontSize(18)
              .onClick(() => {
                // 查找要删除元素的索引
                let index = this.list.findIndex((item) => {
                  return item.id === this.foption.id;
                });
                // 如果找到了，使用splice删除该元素
                if (index !== -1) {
                  this.list.splice(index, 1);
                }
                router.pushUrl({ url: 'pages/Index' })
              })
            Text('编辑')
              .backgroundColor('#72dbb0')
              .width('50%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .fontColor('white')
              .fontWeight(700)
              .fontSize(18)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/AccountingPage',
                  params: {
                    keyTitle: this.foption.title,
                    keyIcon: this.foption.icon,
                    id: this.foption.id
                  }
                }
                )
              })
          }
        }.position({ bottom: 0 }).width('100%').height('10%')
      }
      .width("100%")
      .height("100%")
      .translate({
        y: this.Y
      })
      .backgroundColor("#cffac1")
      .position({
        bottom: 0,
        left: 0,
      })
      .zIndex(100)
      .animation({
        duration: 400
      })
    }
    .linearGradient({
      // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
      colors: [
        ["#d2fdcd", 0.0], // 颜色断点1的颜色和比重，对应组件在180°方向上的起始位置
        ["#72dcae", 1.0], // 颜色断点2的颜色和比重，对应组件在180°方向上的终点位置
      ]
    })
    .height('100%')
    .width('100%')
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}