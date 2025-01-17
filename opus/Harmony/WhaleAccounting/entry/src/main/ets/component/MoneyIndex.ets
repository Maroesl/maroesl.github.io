interface top_tab {
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
  token:string
}

@Component
struct MoneyIndex {
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

  @Styles
  top_list() {
    .margin({ bottom: 5, top: 10 })
  }

  build() {
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Column() {
          Row() {
            Text('收入').fontColor('#ff777272')
              .textAlign(TextAlign.Center)
              .top_list()
          }

          Row() {
            Text(`${this.income}￥`)
              .textAlign(TextAlign.Center)
              .fontSize(20)
              .fontWeight(700)
              .fontColor('#63aa8d')
          }
        }

        Column() {
          Row() {
            Text('支出')
              .fontColor('#ff777272')
              .textAlign(TextAlign.Center)
              .top_list()
          }

          Row() {
            Text(`${this.outcome}￥`)
              .textAlign(TextAlign.Center)
              .fontSize(20)
              .fontWeight(700)
              .fontColor('#63aa8d')
          }
        }

        Column() {
          Row() {
            Text('结余')
              .fontColor('#ff777272')
              .textAlign(TextAlign.Center)
              .top_list()
          }

          Row() {
            Text(`${this.allmoney}￥`)
              .textAlign(TextAlign.Center)
              .fontSize(20)
              .fontWeight(700)
              .fontColor('#63aa8d')
          }
        }
      }
    }

  }
}

export default MoneyIndex;