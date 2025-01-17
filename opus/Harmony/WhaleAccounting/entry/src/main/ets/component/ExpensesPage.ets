// 数据类型校验
interface IconList {
  icon: string,
  title: string
}
interface KeyItem{
  icon:string,
  title:string
}

@Component
struct ExpensesPage {
  @Link expensesList: IconList[]
  @State scrollHeight: string = "0"
  @Link @Watch('onCountUpdated') propHeight: string
  // 点击哪一个
  @Link keyItem:KeyItem

  onCountUpdated(propName: string): void {
    if(this.propHeight === "0%"){
      this.scrollHeight = "70%";
    }else {
      this.scrollHeight = "0";
    }
  }

  showKeBoard ?: () => void

  build() {
    Scroll() {
      Column() {
        Flex({ justifyContent: FlexAlign.SpaceAround, wrap: FlexWrap.Wrap, alignItems: ItemAlign.Start }) {
          ForEach(this.expensesList, (item: IconList) => {
            Column() {
              Image(item.icon)
                .width(30)
                .height(30)
                .margin(4)
              Text(item.title)
                .fontSize(14)
            }
            .width("22%")
            .height("10%")
            .backgroundColor("#fefdf8")
            .borderWidth(1)
            .borderStyle(BorderStyle.Solid)
            .borderColor('#dbe1c0')
            .borderRadius("50%")
            .margin({
              bottom: 20,
              top:4
            })
            .padding({
              top: 4
            })
            .borderWidth(this.keyItem.title == item.title?4:0)
            .borderStyle(BorderStyle.Solid)
            .borderColor("#6bc39c")
            .backgroundColor(this.keyItem.title == item.title?"#f4fff7":"#fefdf8")
            .onClick(()=>{
              if(this.showKeBoard && this.keyItem.title == ''){
                this.showKeBoard()
                this.keyItem = { icon:item.icon,title:item.title }
                // console.log(this.keyItem.title)
              }else if(this.showKeBoard && this.keyItem.title == item.title){
                this.showKeBoard()
                this.keyItem = { icon:'',title:'' }
              }else {
                this.keyItem = { icon:item.icon,title:item.title }
              }
            })
          }, (item: IconList) => item.title)
        }
        Column(){}.height(this.scrollHeight)
      }
    }
    .width("90%")
    .margin({
      top: 40
    })
  }
}

export default ExpensesPage