import { curves, router } from '@kit.ArkUI';
import ExpensesPage from '../component/ExpensesPage'
import IncomePage from '../component/IncomePage'

// 数据类型校验
interface IconList {
  icon: string,
  title: string
}

interface KeyItem {
  icon: string,
  title: string
}

interface UserAccount {
  id: number,
  date: string,
  icon: string,
  title: string,
  price: number,
  dsc: string,
  token: string
}

interface p {
  keyIcon: string
  keyTitle: string
  id: number
}

@Entry
@Component
struct AccountingPage {
  // 类型：1：支出 2： 收入
  @State type: number = 1
  @State showNumberKey: boolean = false
  @State showDes: boolean = false
  // 点击哪一个
  @State keyItem: KeyItem = { icon: '', title: '' }
  // 价格
  @State price: string = ''
  // 备注
  @State dsc: string = ''
  // 是否连续记账
  @State isOnly: boolean = true
  @State handlePopup: boolean = false
  // 图标
  // @State incomeList: IconList[] = [
  //   { icon: 'icon/mifan.png', title: '餐饮' },
  //   { icon: 'icon/shangpin.png', title: '购物' },
  //   { icon: 'icon/riyong.png', title: '日用' },
  //   { icon: 'icon/jiaotong.png', title: '交通' },
  //   { icon: 'icon/shucai.png', title: '蔬菜' },
  //   { icon: 'icon/kafei_1.png', title: '饮品' },
  //   { icon: 'icon/shuiguo.png', title: '水果' },
  //   { icon: 'icon/lingshi.png', title: '零食' },
  // ]
  // @State expensesList: IconList[] = [
  //   { icon: 'icon/mifan.png', title: '餐饮' },
  //   { icon: 'icon/shangpin.png', title: '购物' },
  //   { icon: 'icon/riyong.png', title: '日用' },
  //   { icon: 'icon/jiaotong.png', title: '交通' },
  //   { icon: 'icon/shucai.png', title: '蔬菜' },
  //   { icon: 'icon/kafei_1.png', title: '饮品' },
  //   { icon: 'icon/shuiguo.png', title: '水果' },
  //   { icon: 'icon/lingshi.png', title: '零食' },
  //   { icon: 'icon/fushi.png', title: '服饰' },
  //   { icon: 'icon/waimai.png', title: '外卖' },
  //   { icon: 'icon/maicai.png', title: '买菜' },
  //   { icon: 'icon/yundong.png', title: '运动' },
  //   { icon: 'icon/yule.png', title: '娱乐' },
  //   { icon: 'icon/zhufang.png', title: '住房' },
  //   { icon: 'icon/dianpu.png', title: '社交' },
  //   { icon: 'icon/lipin.png', title: '礼物' },
  //   { icon: 'icon/lvxing.png', title: '旅行' },
  //   { icon: 'icon/kuaidi.png', title: '快递' },
  //   { icon: 'icon/dianying.png', title: '电影票' },
  //   { icon: 'icon/qiche.png', title: '汽车' },
  //   { icon: 'icon/xuexi.png', title: '学习' },
  //   { icon: 'icon/majiang.png', title: '麻将' },
  //   { icon: 'icon/zhuanzhang.png', title: '转账' },
  //   { icon: 'icon/yiliao.png', title: '医疗' },
  // ]
  // @State userAccount: UserAccount[] = [
  //   {
  //     id: Date.now(),
  //     date: new Date().toLocaleDateString(),
  //     icon: 'icon/mifan.png',
  //     title: '餐饮',
  //     price: 99,
  //     dsc: "备注"
  //   },
  // ]
  @StorageLink('Token') token: string = '';
  @StorageLink('incomeList') incomeList: IconList[] = [{ icon: 'icon/mifan.png', title: '餐饮' }];
  @StorageLink('expensesList') expensesList: IconList[] = [{ icon: 'icon/mifan.png', title: '餐饮' }];
  @StorageLink('userAccount') userAccount: UserAccount[] = [{
    id: Date.now(),
    date: new Date().toLocaleDateString(),
    icon: 'icon/mifan.png',
    title: '餐饮',
    price: 99,
    dsc: "备注",
    token: this.token
  },];
  // 获取路由带过来的参数
  @State params: p = router.getParams() as p
  @State o_id: number = 0

  onPageShow(): void {
    if (this.params !== undefined) {
      this.keyItem.icon = this.params.keyIcon || ''
      this.keyItem.title = this.params.keyTitle || ''
      this.o_id = this.params.id || 0
      // console.log("路由参数",this.keyItem.icon,this.keyItem.title,this.o_id)
      this.showKeBoard()
    }
  }

  // 弹出层位移高度
  @State propHeight: string = "120%"
  @State dscHeight: string = "120%"

  // 键盘样式
  @Styles
  keyBoard(){
    .width("20%")
    .height(45)
    .backgroundColor("#fbfefb")
    .borderRadius(8)
    .margin(8)
    .shadow({
      radius: 10,
      color: "#b9e0aa",
      offsetX: 10,
      offsetY: 20
    })
  }

  // 控制弹出层显示隐藏
  showKeBoard: () => void = () => {
    this.showNumberKey = !this.showNumberKey
    if (this.showNumberKey) {
      this.propHeight = "0%"
    } else {
      this.propHeight = "120%"
      this.price = ''
      this.dsc = ''
    }
    console.log("keyitem", JSON.stringify(this.keyItem))
  }
  showDsc: () => void = () => {
    this.showDes = !this.showDes
    if (this.showDes) {
      this.dscHeight = "0%"
    } else {
      this.dscHeight = "120%"
    }
  }

  hideKeBoard() {
    this.showNumberKey = false
    this.propHeight = "120%"
    this.price = ''
  }

  // 修改textInput的值
  onChangeValue(n?: string) {
    this.price = this.price + (n || 0)
    let parts: Array<string> = this.price.split(/[+-]/);
    console.log("parts", parts)
    if (this.price[0] == "-") {
      let num = this.price.slice(1, this.price.length)
      parts = num.split(/[+-]/);
      if (num.slice(0, num.length - 1).includes('+') && parts.length > 2) {
        let sum = -1 * Number(parts[0]) + Number(parts[1])
        let last = this.price.slice(-1)
        this.price = sum.toString() + last
        console.log('price1', sum)
      } else if (num.includes('-') && parts.length > 2) {
        let sum = -1 * Number(parts[0]) - Number(parts[1])
        let last = this.price.slice(-1)
        this.price = sum.toString() + last
        console.log('price', sum)
      }
    } else {
      if (this.price.slice(0, this.price.length - 1).includes('+') && parts.length > 2) {
        let sum = Number(parts[0]) + Number(parts[1])
        let last = this.price.slice(-1)
        this.price = sum.toString() + last
        console.log('price1', sum)
      } else if (this.price.includes('-') && parts.length > 2) {
        let sum = Number(parts[0]) - Number(parts[1])
        let last = this.price.slice(-1)
        this.price = sum.toString() + last
        console.log('price', sum)
      }
    }
  }

  // 创建订单
  onCreateOrder() {
    let parts: Array<string> = this.price.split(/[+-]/);
    // console.log("parts",parts)
    if (parts.length == 0) {
      this.price = "0"
    } else if (parts.length < 2) {
      this.price = parts[0]
    } else {
      this.price = this.price + "- 0"
      let parts: Array<string> = this.price.split(/[+-]/);
      if (this.price.slice(0, this.price.length - 2).includes('+') && parts.length > 2) {
        let sum = Number(parts[0]) + Number(parts[1])
        this.price = sum.toString()
        // console.log('price1', sum)
      } else if (this.price.includes('-') && parts.length > 2) {
        let sum = Number(parts[0]) - Number(parts[1])
        this.price = sum.toString()
        // console.log('price', sum)
      }
    }
    // console.log("dsc", this.dsc)
    if (this.userAccount.findIndex(item => {
      return item.id == this.o_id
    }) != -1) {
      this.userAccount = this.userAccount.map(item => {
        if (item.id == this.o_id) {
          // console.log("找到了",this.price)
          item.id = this.o_id
          item.icon = this.keyItem.icon
          item.title = this.keyItem.title
          item.price = this.type === 1 ? -1 * Number(this.price) : Number(this.price)
          item.dsc = this.dsc === '' ? item.dsc : this.dsc
          item.token = this.token
          return item
        }
        return item
      })
      this.price = ''
      this.hideKeBoard()
      this.keyItem = { icon: '', title: '' }
      this.o_id = 0
      console.log("userAccount", JSON.stringify(this.userAccount))
      if(this.isOnly){
        router.pushUrl({
          url: 'pages/Index',
        })
      } else {
        this.handlePopup = true
        setTimeout(()=>{
          this.handlePopup = false
        },1000)
      }
    } else {
      this.userAccount = [...this.userAccount, {
        id: Date.now(),
        date: new Date().toLocaleDateString(),
        icon: this.keyItem.icon,
        title: this.keyItem.title,
        price: this.type === 1 ? -1 * Number(this.price) : Number(this.price),
        dsc: this.dsc,
        token: this.token
      }]
      this.price = ''
      this.hideKeBoard()
      this.keyItem = { icon: '', title: '' }
      this.dsc = ''
      console.log("userAccount", JSON.stringify(this.userAccount))
      if(this.isOnly){
        router.pushUrl({
          url: 'pages/Index',
        })
      }else {
        this.handlePopup = true
        setTimeout(()=>{
          this.handlePopup = false
        },1000)
      }
    }
  }

  // 动画
  // 第一步，创建TransitionEffect
  private effect: TransitionEffect =
    // 创建默认透明度转场效果,并指定了springMotion(0.6, 0.8)曲线
    TransitionEffect.OPACITY.animation({
      curve: curves.springMotion(0.6, 0.8)
    })// 通过combine方法,这里的动画参数会跟随上面的TransitionEffect，也就是springMotion(0.6, 0.8)
      .combine(TransitionEffect.scale({
        x: 0,
        y: 0
      }))// 添加旋转转场效果，这里的动画参数会跟随上面带animation的TransitionEffect，也就是springMotion(0.6, 0.8)
      .combine(TransitionEffect.rotate({ angle: 90 }))// 添加平移转场效果，这里的动画参数使用指定的springMotion()
      .combine(TransitionEffect.translate({ y: 150 })
        .animation({ curve: curves.springMotion() }))// 添加move转场效果，这里的动画参数会跟随上面的TransitionEffect，也就是springMotion()
      .combine(TransitionEffect.move(TransitionEdge.END))

  build() {
    Scroll() {
      Column() {
        // 头部
        Row() {
          Image('icon/backbuttom.png')
            .width(24)
            .height(16)
            .onClick(() => {
              router.pushUrl({url:'pages/Index'})
            })
          Row() {
            Text("账本")
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor("#459a7f")
          }
          .margin({
            left: 40
          })

          Row() {
            Text(this.isOnly ? "单笔记账" : "连续记账")
              .fontSize(18)
              .fontColor("#459a7f")
              .fontWeight(FontWeight.Bold)
              .onClick(()=>{
                this.isOnly = !this.isOnly
              })
              .bindPopup(this.handlePopup, {
                message: '叮咚！完成一笔记账',
              })
          }
        }
        .width("90%")
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({
          top: 12
        })

        // 记账类型
        Row() {
          Text("支出")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.type === 1 ? "#459a7f" : "#ffa0a0a0")
            .onClick(() => {
              this.type = 1
              if (this.hideKeBoard) {
                this.hideKeBoard()
                this.keyItem.title = ''
              }
            })
          Text("收入")
            .fontSize(20)
            .fontColor(this.type === 2 ? "#459a7f" : "#ffa0a0a0")
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.type = 2
              if (this.hideKeBoard) {
                this.hideKeBoard()
                this.keyItem.title = ''
              }
            })
        }
        .width("90%")
        .justifyContent(FlexAlign.SpaceAround)
        .margin({
          top: 40
        })

        // 主体内容
        if (this.type === 1) {
          ExpensesPage({
            expensesList: this.expensesList,
            showKeBoard: this.showKeBoard,
            propHeight: this.propHeight,
            keyItem: this.keyItem
          })
            .transition(this.effect)
        } else {
          IncomePage({
            incomeList: this.incomeList,
            showKeBoard: this.showKeBoard,
            propHeight: this.propHeight,
            keyItem: this.keyItem
          })
            .transition(this.effect)
        }

        // 弹出层
        Column() {
          Stack() {
            Row() {
              Image("icon/qianbao.png")
                .width(30)
                .height(30)
                .padding({
                  right: 6
                })
              TextInput({ text: `￥ ${this.price || 0}` })
                .width("60%")
                .height(60)
                .fontSize(20)
                .focusable(false)
                .backgroundColor(Color.Transparent)
              Text("添加备注")
                .fontColor("#aeada8")
                .fontSize(14)
                .onClick(() => {
                  if (this.showDsc) {
                    this.showDsc()
                  }
                })
              Image("icon/shuma.png")
                .width(30)
                .height(30)
                .margin({
                  left: 4
                })
            }
            .backgroundColor("#fff")
            .height(44)
            .padding(6)
            .borderRadius(8)
          }
          .backgroundColor("#97dea4")
          .height(72)
          .width("100%")
          .borderRadius({
            topLeft: 12,
            topRight: 12,
          })
          .padding({
            top: 6,
            left: 4,
            right: 4
          })

          Column() {
            Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
              Text("7")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("7")
                  }
                })
              Text("8")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("8")
                  }
                })
              Text("9")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("9")
                  }
                })
              Text("今天")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(14)
                .fontColor("#beb17a")
                .keyBoard()
                .backgroundColor("#fff4bc")
                .shadow({
                  radius: 10,
                  color: "#f3d494",
                  offsetX: 10,
                  offsetY: 20
                })
              Text("4")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("4")
                  }
                })
              Text("5")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("5")
                  }
                })
              Text("6")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("6")
                  }
                })
              Text("+")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("+")
                  }
                })
              Text("1")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("1")
                  }
                })
              Text("2")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("2")
                  }
                })
              Text("3")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("3")
                  }
                })
              Text("-")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("-")
                  }
                })
              Text(".")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue(".")
                  }
                })
              Text("0")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  if (this.onChangeValue) {
                    this.onChangeValue("0")
                  }
                })
              Text("清除")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#a8ccbe")
                .keyBoard()
                .onClick(() => {
                  this.price = ""
                })
              Text("完成")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(20)
                .fontColor("#fdf6f2")
                .keyBoard()
                .backgroundColor("#fd918d")
                .shadow({
                  radius: 10,
                  color: "#eb746e",
                  offsetX: 10,
                  offsetY: 20
                })
                .onClick(() => {
                  if (this.onCreateOrder) {
                    this.onCreateOrder()
                  }
                })
            }
          }
          .backgroundColor("#cceebc")
          .padding(8)
          .height("100%")
        }
        .width("100%")
        .height("50%")
        .translate({
          y: this.propHeight
        })
        .backgroundColor("#fff")
        .position({
          bottom: 0,
          left: 0,
        })
        .animation({
          duration: 400
        })

        // 备注框
        Column() {
          Scroll() {
            Row() {
              TextArea({ text: this.dsc ? this.dsc : '', placeholder: `请输入备注` })
                .width("70%")
                .height(60)
                .fontSize(20)
                .onChange((value: string) => {
                  this.dsc = value;
                })
              Blank()
              Text("完成")
                .textAlign(TextAlign.Center)
                .fontWeight(600)
                .fontSize(14)
                .fontColor("#fdf6f2")
                .keyBoard()
                .backgroundColor("#fd918d")
                .shadow({
                  radius: 10,
                  color: "#eb746e",
                  offsetX: 10,
                  offsetY: 20
                })
                .onClick(() => {
                  this.showDsc()
                })
            }
            .backgroundColor("#fff")
            .padding(6)
            .borderRadius(8)
            .justifyContent(FlexAlign.SpaceAround)
          }
          .width("100%")
          .borderRadius({
            topLeft: 12,
            topRight: 12,
          })
          .padding({
            top: 6,
            left: 4,
            right: 4
          })
        }
        .width("100%")
        .height("50%")
        .justifyContent(FlexAlign.Start)
        .translate({
          y: this.dscHeight
        })
        .backgroundColor("#97dea4")
        .position({
          bottom: 0,
          left: 0,
        })
        .animation({
          duration: 400
        })
      }
      .alignItems(HorizontalAlign.Center)
      .height("100%")
      .width("100%")
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
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}