import { BottomItem, ControlSearchParameter } from '../viewmodel/ControlSearchParameter';

@Component
export struct ControlSearchComponent {
  /**
   * The width percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';
  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';
  /**
   * Bottom row height.
   */
  readonly BOTTOM_ROW_HEIGHT: string = '40%';
  /**
   * Critical form height.
   */
  readonly CRITICAL_FORM_HEIGHT: number = 160;
  /**
   * Type of height.
   */
  readonly TYPE_HEIGHT: string = 'number';
  @Link controlSearchParameter: ControlSearchParameter;
  @State widgetHeight: boolean = true;
  @State today :string = new Date().toLocaleDateString()

  build() {
    Stack() {
      Image("icon/bg_simple_mode_top.webp")
        .width(this.FULL_WIDTH_PERCENT)
        .height(this.FULL_HEIGHT_PERCENT)

      Column() {
        Row() {
          Search({ placeholder: this.controlSearchParameter.placeholder })
            .fontColor(this.controlSearchParameter.searchColor)
            .placeholderColor(this.controlSearchParameter.placeholderColor)
            .searchIcon(this.controlSearchParameter.searchIcon)
            .backgroundBlurStyle(this.controlSearchParameter.searchBackgroundBlurStyle)
            .opacity(this.controlSearchParameter.searchOpacity)
            .backgroundColor(this.controlSearchParameter.searchBackgroundColor)
        }
        .padding($r('app.float.search_padding'))

        Row() {
          ForEach(this.controlSearchParameter.bottomItemList, (item: BottomItem) => {
            FormLink(item.formLinkParam) {
              Column() {
                Image(item.icon)
                  .width(this.widgetHeight ? $r('app.float.bottom_icon_size_sm') : $r('app.float.bottom_icon_size_lg'))
                  .height(this.widgetHeight ? $r('app.float.bottom_icon_size_sm') : $r('app.float.bottom_icon_size_lg'))
                Text(item.title)
                  .fontSize(this.widgetHeight ? $r('app.float.bottom_title_sm') : $r('app.float.bottom_title_lg'))
                  .fontWeight(FontWeight.Medium)
                  .margin({
                    top: $r('app.float.bottom_title_margin')
                  })
                  .fontColor(this.controlSearchParameter.auxiliaryTextColor ?? Color.White)
              }
            }
          }, (item: BottomItem, index: number) => index + JSON.stringify(item))
        }
        .width(this.FULL_WIDTH_PERCENT)
        .height(this.widgetHeight ? $r('app.float.bottom_row_height') : this.BOTTOM_ROW_HEIGHT)
        .padding({
          bottom: this.widgetHeight ? $r('app.float.bottom_row_padding') : 0,
          left: $r('app.float.bottom_row_padding'),
          right: $r('app.float.bottom_row_padding')
        })
        .justifyContent(FlexAlign.SpaceAround)
        .alignItems(this.widgetHeight ? VerticalAlign.Bottom : VerticalAlign.Center)
        .linearGradient({
          direction: GradientDirection.Bottom,
          repeating: false,
          colors: [['#0dffffff', 0.0],
            ['#8b8d8d8d', 1.0]]
        })
      }
      .height(this.FULL_HEIGHT_PERCENT)
      .width(this.FULL_WIDTH_PERCENT)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Center)
      .onAreaChange((oldArea: Area, newArea: Area) => {
        let height = newArea.height;
        if (typeof height === this.TYPE_HEIGHT) {
          this.widgetHeight = height < this.CRITICAL_FORM_HEIGHT;
        }
      })
    }
  }
}