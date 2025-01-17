// import { Size } from '@ohos/hypium';


import router from '@ohos.router';

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
  @State usnameprpos: boolean = false
  @State usnameprpostext: string = ''
  @State usvalueprops: boolean = false
  @State usvaluepropstext: string = ''
  @State uspasswordprops: boolean = false
  @State uspasswordtextprops: string = ''
  @State usRESpasswordprops: boolean = false
  @State usRESpasswordtextprops: string = ''
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
  @StorageLink('user') user: userinfo|undefined = {
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
              router.pushUrl({ url: "pages/Index" })
            })

          Text(this.loginText)
            .fontColor("#4bb28a")
            .fontSize(23)
            .fontWeight(700)

          Text(this.ValoginText)
            .fontColor("#4bb28a")
            .fontSize(20)
            .onClick(() => {
              this.Register = !this.Register
              this.loginText = this.Register ? "注册" : "登录"
              this.ValoginText = this.Register ? "登录" : "注册"
              this.usname = this.Register ? "请设置你的用户名" : "用户名"
            })


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
            Column() {
              Image($r("app.media.circle_viewfinder"))
                .width(28)
                .height(28)
            }
            .width(35)
            .height(35)
            .backgroundColor(Color.White)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)

            .position({
              bottom: 0,
              right: 0
            })
            .borderRadius(20)
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
                  this.usnameprpos = false
                  if (this.usnametext != "请输入用户名") {
                    this.usname = this.usnametext
                  } else {
                    this.usnametext = "请输入用户名"
                  }
                  this.usnameset = false
                  this.usnametext = "请输入用户名"
                  console.log("关", this.usnameset)
                })


            } else {
              Row() {
                Text(this.usname)
                  .fontSize(22)
                  .bindPopup(this.usnameprpos, {
                    message: this.usnameprpostext,
                  })

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

        //   输入框
        Column() {
          Row() {

            Text("账号:")
            TextInput({ placeholder: "请输入账号" })
              .bindPopup(this.usvalueprops, {
                message: this.usvaluepropstext,
              })
              .width("70%")
              .height(30)
              .placeholderFont({
                size: 13
              })
              .fontSize(14)
              .onChange((val) => {
                this.usvalue = val
              })

          }
          .width("100%")
          .justifyContent(FlexAlign.SpaceBetween)

          Row() {

            Text("密码")
            TextInput({ placeholder: "请输入密码" })
              .bindPopup(this.uspasswordprops, {
                message: this.uspasswordtextprops,
              })
              .type(InputType.Password)
              .width("70%")
              .height(30)
              .placeholderFont({
                size: 13
              })
              .fontSize(14)
              .onChange((val) => {
                this.uspassword = val
              })


          }.margin({
            top: 20
          })
          .width("100%")
          .justifyContent(FlexAlign.SpaceBetween)


          if (this.Register) {
            Row() {

              Text("确认密码")
              TextInput({ placeholder: "请重复一次密码" })
                .bindPopup(this.usRESpasswordprops, {
                  message: this.usRESpasswordtextprops,
                })
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


            }.margin({
              top: 20
            })
            .width("100%")
            .justifyContent(FlexAlign.SpaceBetween)

          }

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
        Text(this.loginText)
          .position({
            top: "4%",
            left: "45%",
          })
          .fontSize(22)
          .translate({
            x: "-50%"
          })
          .fontColor(Color.White)

      }.onClick(() => {
        this.usnameprpos = false
        this.usvalueprops = false
        this.uspasswordprops = false
        this.usRESpasswordprops = false

        console.log("开始校验")

        // 用户名校验
        if (this.usname == "请设置你的用户名") {
          this.usnameprpostext = "请输入用户名"
          this.usnameprpos = true
        }

        // 账号校验
        else if (this.usvalue == "") {
          this.usvaluepropstext = "请输入账号！"
          this.usvalueprops = true
        }

        // 密码校验
        else if (this.uspassword == "") {
          this.uspasswordtextprops = "请输入密码"
          this.uspasswordprops = true
        }

        // 确认密码校验
        else if (this.usRESpassword == "" && this.loginText == "注册") {
          this.usRESpasswordtextprops = "请再次输入密码"
          this.usRESpasswordprops = true
        } else if (this.uspassword != this.usRESpassword && this.loginText == "注册") {
          this.usRESpasswordtextprops = "两次密码不一致！"
          this.usRESpasswordprops = true
        } else {


          if (this.loginText == "注册") {
            // 注册逻辑
            console.log("正在注册")

            let repeat = this.usarr.some((item) => {
              item.usname == this.usname
            })

            if (repeat) {
              this.usvaluepropstext = "账号已存在！请前往登录!"
              this.usvalueprops = true
            } else {
              // 注册成功逻辑
              this.usarr.push({
                usname: this.usname,
                usval: this.usvalue,
                uspsd: this.uspassword,
                usTonken: `${this.usvalue}${this.uspassword}`

              })
              this.AlluserArray.push({
                usname: this.usname,
                usval: this.usvalue,
                uspsd: this.uspassword,
                usTonken: `${this.usvalue}${this.uspassword}`

              })
              this.Register = !this.Register
              this.loginText = this.Register ? "注册" : "登录"
              this.ValoginText = this.Register ? "登录" : "注册"
              // this.usname = this.Register ? "请设置你的用户名" : this.usname


              console.log("账户列表", JSON.stringify(this.usarr))
            }


          } else {

            console.log("正在登录")
            if (this.usarr.some((item) => {
              console.log("对比", item.usval,)
              return item.usval == `${this.usvalue}`
            }) && !this.usarr.some((item) => {
              return item.usTonken == `${this.usvalue}${this.uspassword}`
            })) {
              this.usvaluepropstext = "账号或者密码输入错误"
              this.usvalueprops = true
            } else if (this.usarr.some((item) => {
              return item.usTonken == `${this.usvalue}${this.uspassword}`
            })) {
              // 登录成功逻辑

              this.user = this.usarr.find((item) => {
                return item.usTonken == `${this.usvalue}${this.uspassword}`
              })
              // this.user = {
              //   usname: this.user.usname,
              //   usval: this.usvalue,
              //   uspsd: this.uspassword,
              //   usTonken: `${this.usvalue}${this.uspassword}`
              // }
              this.Token = `${this.usvalue}${this.uspassword}`
              router.pushUrl({ url: "pages/Index" })

              console.log("yes用户列表", JSON.stringify(this.usarr))
              console.log("yes当前用户", JSON.stringify(this.user))
              console.log("yes当前Token", JSON.stringify(this.Token))
              // this.loginText = "登录cc12111c！"
            } else {
              console.log("账户列表", JSON.stringify(this.usarr))
              this.usvaluepropstext = "用户不存在"
              this.usvalueprops = true

            }


          }


        }


      })

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




