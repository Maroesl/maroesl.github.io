import { router } from '@kit.ArkUI';
import json from '@ohos.util.json';
import { JSON } from '@kit.ArkTS';

interface out_in {
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
  dsc: string,
  token:string
}

@Component
struct OptionIndex {
  @Link foption: out_in
  openY?: () => void
  // @State list: out_in[] = [
  //   {
  //     id: 1,
  //     icon: 'icon/lipin.png',
  //     title: '礼品',
  //     dsc: '来财',
  //     price: -250,
  //     date: '12.20',
  //   },
  //   {
  //     id: 2,
  //     icon: 'icon/shangpin.png',
  //     title: '商品',
  //     price: -930,
  //     dsc: '',
  //     date: '12.20'
  //
  //   },
  //   {
  //     id: 3,
  //     icon: 'icon/img2/gr(3).png',
  //     title: '工资',
  //     dsc: '发财了',
  //     price: +1000,
  //     date: '12.20'
  //   },
  //   {
  //     id: 4,
  //     icon: 'icon/img2/gr(3).png',
  //     title: '工资',
  //     dsc: '发财了',
  //     price: +1000,
  //     date: '12.20'
  //   },
  //   {
  //     id: 5,
  //     icon: 'icon/img2/gr(3).png',
  //     title: '工资',
  //     dsc: '发财了',
  //     price: +1000,
  //     date: '12.20'
  //   }, {
  //   id: 41,
  //   icon: 'icon/img2/gr(3).png',
  //   title: '工资',
  //   dsc: '发财了',
  //   price: +1000,
  //   date: '12.20'
  // }, {
  //   id: 42,
  //   icon: 'icon/img2/gr(3).png',
  //   title: '工资',
  //   dsc: '发财了',
  //   price: +1000,
  //   date: '12.20'
  // }, {
  //   id: 43,
  //   icon: 'icon/img2/gr(3).png',
  //   title: '工资',
  //   dsc: '发财了',
  //   price: +1000,
  //   date: '12.20'
  // }, {
  //   id: 45,
  //   icon: 'icon/img2/gr(3).png',
  //   title: '工资',
  //   dsc: '发财了',
  //   price: +1000,
  //   date: '12.20'
  // }
  // ]

  @StorageLink('userAccount') userAccount:UserAccount[] =[]
  @StorageLink('Token') token:string = ''
  @State list:UserAccount[] = this.userAccount.filter(item =>{
      return item.token == this.token
  })

  // @StorageLink('userAccount') list: UserAccount[] = []
  // 引入筛选模式变量 -lxz
  // @State filterMod: number = 0
  @Prop @Watch('filterMod2') filterMod: number
  @State RElist: UserAccount[] = this.list

  filterMod2() {
    if (this.filterMod == 0) {

      this.RElist = this.list

    } else if (this.filterMod == 1) {
      this.RElist = this.list.filter((item) => {
        return item.price < 0
      })
    } else {
      this.RElist = this.list.filter((item) => {
        return item.price > 0
      })
    }

    console.log("筛选后数组", JSON.stringify(this.RElist), "模式", this.filterMod)
  }

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.ColumnReverse }) {
        // 更改了循环的数组 -lxz
        ForEach(this.RElist, (item: out_in) => {
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Row() {
              Image(item.icon).width(30).margin({ right: 10 })
              if (item.dsc) {
                Column() {
                  Text(item.title).textAlign(TextAlign.Start).width("60%")
                  Text(item.dsc).fontSize(10).fontColor('#595b5d').textAlign(TextAlign.Start).width("60%")
                }
              } else {
                Text(item.title)
              }
            }

            Row() {
              if (item.price > 0) {
                Text(`+${item.price}￥`).height(20)
              } else {
                Text(`${item.price}￥`).height(20)
              }
            }
          }.margin({ top: 10, bottom: 10 }).onClick(() => {
            console.log('option', item.title)
            this.foption.id = item.id
            this.foption.icon = item.icon
            this.foption.title = item.title
            this.foption.dsc = item.dsc
            this.foption.price = item.price
            this.foption.date = item.date
            console.log('option', JSON.stringify(this.foption))
            if (this.openY) {
              this.openY()
            }

          })
        }, (item: out_in) => `option_${item.id}`)

      }.width("100%")
    }.padding(20).margin({ bottom: 40 })

  }
}

export default OptionIndex;