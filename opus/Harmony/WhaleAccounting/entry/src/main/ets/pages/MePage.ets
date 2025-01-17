// import { Size } from '@ohos/hypium';


import router from '@ohos.router';
import json from '@ohos.util.json';

interface userinfo {
  usname: string
  usval: string
  uspsd: string
  usTonken: string
}


@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World';
  // 当前用户名
  @State usname: string = "用户名";
  @State Register: boolean = false
  @State loginText: string = "登录"
  @State ValoginText: string = "注册"
  // 设置弹出提示
  // @State usnameprpos: boolean = false
  // @State usnameprpostext: string = ''
  // @State usvalueprops: boolean = false
  // @State usvaluepropstext: string = ''
  // @State uspasswordprops: boolean = false
  // @State uspasswordtextprops: string = ''
  // @State usRESpasswordprops: boolean = false
  // @State usRESpasswordtextprops: string = ''
  // 设置修改用户名
  @State usnameset: boolean = false
  @State usnametext: string = '请输入用户名'
  // 账号密码绑定
  @State usvalue: string = ""
  @State uspassword: string = ""
  @State usRESpassword: string = ""
  // 账户列表
  @State AlluserArray: Array<userinfo> = [{
    usname: 'string',
    usval: 'string',
    uspsd: 'string',
    usTonken: 'string'
  }]
  // 持久化存储引入
  @StorageLink('AlluserArr') usarr: Array<userinfo> = [{
    usname: 'string',
    usval: 'string',
    uspsd: 'string',
    usTonken: 'string'
  }]
  @StorageLink('user') user: userinfo = {
    usname: 'string',
    usval: 'string',
    uspsd: 'string',
    usTonken: 'string'
  }
  @StorageLink('Token') Token: string = ""

  build() {
    Column() {
      // 上半部分
      Column() {
        // 顶部栏
        Row() {
          Image($r("app.media.back"))
            .width(30)
            .height(30)
            .onClick(() => {
              router.back()
            })

          Text("用户信息")
            .fontColor("#4bb28a")
            .fontSize(23)
            .fontWeight(700)

          Text("")
            .fontColor("#4bb28a")
            .fontSize(20)
            .width(30)



        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width("100%")
        .padding({
          left: 20,
          right: 20
        })

        // 用户头像
        Column() {
          // 图
          Column() {
            // Image($r("app.media."))
            // Column() {
            //   Image($r("app.media.circle_viewfinder"))
            //     .width(28)
            //     .height(28)
            // }
            // .width(35)
            // .height(35)
            // .backgroundColor(Color.White)
            // .justifyContent(FlexAlign.Center)
            // .alignItems(HorizontalAlign.Center)

            // .position({
            //   bottom: 0,
            //   right: 0
            // })
            // .borderRadius(20)
          }
          .backgroundImage($r("app.media.icon_simple_bottom_mine"))
          .backgroundImageSize(1)
          .backgroundColor(Color.White)
          .height(120)
          .width(120)
          .borderRadius(70)
          .shadow({ radius: 1200, color: "#effbd3" })

          //   用户名
          Row() {
            if (this.usnameset) {
              TextInput({ placeholder: this.usnametext })
                .fontSize(18)
                .width(200)
                .height(35)
                .placeholderFont({
                  size: 13
                })
                .onChange((val) => {
                  this.usnametext = val
                })
                .onSubmit(() => {
                  // 更新全部用户信息数据
                  this.usarr = this.usarr.map((item) => {
                    return item.usTonken == this.user.usTonken ? {
                      usval: item.usval,
                      uspsd: item.uspsd,
                      usTonken: item.usTonken,
                      usname: this.usnametext
                    } : item
                  })
                  //  更新当前用户信息
                  this.user.usname = this.usnametext

                  this.usnameset = !this.usnameset
                  console.log("用户列表", JSON.stringify(this.usarr))
                  console.log("当前用户", JSON.stringify(this.user))

                })


            } else {
              Row() {
                Text(this.user.usname)
                  .fontSize(22)
                  .fontColor("#9a9792")

              }

            }
            Image($r('app.media.square_and_pencil'))
              .width(25)
              .height(25)
              .margin({
                left: 10
              }).onClick(() => {

              if (this.usnameset) {
                if (this.usnametext != "请输入用户名") {
                  this.usname = this.usnametext
                } else {
                  this.usnametext = "请输入用户名"
                }
                this.usnameset = false
                this.usnametext = "请输入用户名"
                console.log("关", this.usnameset)

              } else {
                this.usnameset = true
                console.log("开", this.usnameset)
              }
            })

          }

        }.height(190)
        .width("100%")
        // .backgroundColor("#afafaf")
        .margin({
          top: 20
        })
        .justifyContent(FlexAlign.SpaceAround)

        //   用户信息
        Column() {
          Row() {

            Text("ID:")
            Text(this.user.usTonken)
              .fontColor("#9a9792")
              .fontWeight(700)
              .height(30)


          }
          .width("100%")
          .justifyContent(FlexAlign.SpaceBetween)

          Row() {

            Text("账户：")
              .fontWeight(700)

            Text(this.user.usval)
              .fontColor("#9a9792")
              .height(30)

          }.margin({
            top: 20
          })
          .width("100%")
          .justifyContent(FlexAlign.SpaceBetween)


          Row() {

            Text("密码")
              .fontWeight(700)
            if (this.Register) {
              TextInput({ placeholder: "请输入修改的密码" })
                .type(InputType.Password)
                .width("70%")
                .height(30)
                .placeholderFont({
                  size: 13
                })
                .fontSize(14)
                .onChange((val) => {
                  this.usRESpassword = val
                })
                .onSubmit(() => {
                  // 更新全部用户信息数据
                  this.usarr = this.usarr.map((item) => {
                    return item.usTonken == this.user.usTonken ? {
                      usval: item.usval,
                      uspsd: this.usRESpassword,
                      usname: item.usname,
                      usTonken: `${item.usval}${this.usRESpassword}`
                    } : item
                  })
                  this.Register = !this.Register
                  //  更新当前用户信息
                 this.user.uspsd = this.usRESpassword
                  this.user.usTonken = `${this.user.usval}${this.usRESpassword}`

                  // 更新token信息
                  this.Token = `${this.user.usval}${this.usRESpassword}`

                  console.log("用户列表", JSON.stringify(this.usarr))
                  console.log("当前用户", JSON.stringify(this.user))
                  console.log("当前标识符",this.Token)

                })

            } else {
              Text('去更改')
                .fontColor("#78b27e")
                .backgroundColor("#e0f79d")
                .padding({
                  top: 5,
                  bottom: 5,
                  left: 10,
                  right: 10
                })
                .borderRadius(20)
                .border({
                  width: 3,
                  color: "#bbdf85"
                })
                .onClick(() => {
                  this.Register = !this.Register
                })
            }

          }.margin({
            top: 20
          })
          .width("100%")
          .justifyContent(FlexAlign.SpaceBetween)

        }
        // .backgroundColor("#ff0000")
        .margin({
          top: 20
        })
        .width("90%")
        .padding(20)
        .border({
          width: 3,
          color: "#9de0c4"
        })
        .borderRadius(20)

      }


      Row() {
        Image($r('app.media.btn_shop_buy_dlg')).width("90%")
          .scale({
            y: 0.7, //设置图片的y轴（高度）缩放的倍率，1为默认大小

          })
        Text("退出登录")
          .position({
            top: "4%",
            left: "45%",
          })
          .fontSize(22)
          .translate({
            x: "-50%"
          })
          .fontColor(Color.White)
          .onClick(() => {
            this.user = {
              usval: "未登录",
              uspsd: "未登录",
              usTonken: "未登录",
              usname: "未登录"
            }
            this.Token = ''

            router.pushUrl({ url: "pages/LoginPage" })

          })

      }

    }
    .backgroundImage($r("app.media.backgroud2"))
    .backgroundImageSize(1)
    .justifyContent(FlexAlign.SpaceBetween)
    .height('100%')
    .width('100%')
    .backdropBlur(5)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}




