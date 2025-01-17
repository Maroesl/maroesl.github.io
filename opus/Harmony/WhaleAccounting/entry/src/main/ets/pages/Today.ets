import router from '@ohos.router';

interface userinfo {
  usname: string
  usval: string
  uspsd: string
  usTonken: string
}

const date = new Date();
const year = date.getFullYear();
const month = (date.getMonth() + 1).toString().padStart(2, '0');
const day = date.getDate().toString().padStart(2, '0');
let pay = `${year}${month}${day}888`;
const nowdate = new Date().toLocaleString()

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
struct Today {

  @StorageLink('userAccount') userAccount:UserAccount[] =[]
  @StorageLink('Token') token:string = ''
  @State list:UserAccount[] = this.userAccount.filter(item =>{
    return item.token == this.token
  })

  @StorageLink('user') user: userinfo = {
    usname: 'string',
    usval: 'string',
    uspsd: 'string',
    usTonken: 'string'
  }
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

      Column() {
        Row() {
          Column() {
            Text('Whale商店').fontSize(30).margin({ top: 20, bottom: 10 }).fontWeight(800)
            Text('记录每一笔美好').fontWeight(600)
          }.width('100%')
          Image('icon/img_1.png').width(20).position({ top: 10, right: -10 }).onClick(()=>{
            router.pushUrl({url:'pages/Index'})
          })
        }

        // 消费日期
        Row() {
          Row() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Text('消费日期：').fontSize(14)
              Text(`${nowdate}`).fontSize(14)
            }
          }
        }.margin({ top: 20 })

        // 交易单号
        Row() {
          Row() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Text('交易单号：').fontSize(14)
              Text(`${pay}`).fontSize(14)
            }
          }
        }.margin({ top: 10 })

        //
        // 服务员
        Row() {
          Row() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Text('服务员：').fontSize(14)
              Text(`${this.user.usname}`).fontSize(14)
            }
          }
        }.margin({ top: 10 })

        //tab
        Row() {
          Text('类目').width('25%').textAlign(TextAlign.Center)
          Text('数量').width('25%').textAlign(TextAlign.Center)
          Text('备注').width('25%').textAlign(TextAlign.Center)
          Text('小计').width('25%').textAlign(TextAlign.Center)
        }.margin({ top: 30 })

        // 分割线
        Row() {
        }.margin(20).borderStyle(BorderStyle.Dashed)
        .borderWidth({ top: 1 })
        .width('100%')

        Row() {
          Scroll() {
            Flex({ direction: FlexDirection.ColumnReverse }) {
              ForEach(this.list, (item: UserAccount) => {
                Row() {
                  Text(`${item.title}`).width('25%').textAlign(TextAlign.Center)
                  Text('x1').width('25%').textAlign(TextAlign.Center)
                  if (item.dsc) {
                    Text(`${item.dsc}`).width('25%').textAlign(TextAlign.Center)
                  } else {
                    Text(`无`).width('25%').textAlign(TextAlign.Center)
                  }
                  Text(`${item.price}`).width('25%').textAlign(TextAlign.Center)
                }.width('100%')
              }, (item: UserAccount) => `option_${item.id}`)
            }.width("100%")
          }
        }

        // 分割线
        Row() {
        }.margin(20).borderStyle(BorderStyle.Dashed)
        .borderWidth({ top: 1 })
        .width('100%')

        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start }) {
          Text(`总笔数：${this.list.length}`).margin({ top: 10 })
          Text(`支出合计：${this.income}`).margin({ top: 10 })
          Text(`收入合计：${this.outcome}`).margin({ top: 10 })
          Text(`今日结余：${this.allmoney}`).fontSize(22).fontWeight(600).margin({ top: 20 })
        }.width('100%').height(120)

        // 分割线
        Row() {
        }.margin(20).borderStyle(BorderStyle.Dashed)
        .borderWidth({ top: 1 })
        .width('100%')

        Row() {
          Text('闹钟一响，黄金万两，来财~！')
        }.margin({ top: 20 })

        Row() {
          Image('icon/img.png').width('100%').height(20).margin({ top: 20, bottom: 40 })
        }
      }
      .backgroundColor('white')
      .padding({ left: 20, right: 20 })
      .borderRadius(10)
      .width('100%')
      .border({ width: 1 })
    }
    .backgroundColor('#ccc')
    .linearGradient({
      // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
      colors: [
        ["#d2fdcd", 0.0], // 颜色断点1的颜色和比重，对应组件在180°方向上的起始位置
        ["#fff", 1.0],// 颜色断点2的颜色和比重，对应组件在180°方向上的终点位置
      ]
    })
    .padding(20)
    .height('100%')
    .width('100%')
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}