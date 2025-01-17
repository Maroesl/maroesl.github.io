export class ControlSearchParameter {
  /**
   * Search place holder.
   */
  placeholder: ResourceStr = '';
  /**
   * Search place holder color.
   */
  placeholderColor: ResourceColor = Color.White;
  /**
   * Search font color.
   */
  searchColor: ResourceColor = '';
  /**
   * Search icon.
   */
  searchIcon: IconOptions = { color: Color.White };
  /**
   * Search background blur style.
   */
  searchBackgroundBlurStyle?: BlurStyle = BlurStyle.COMPONENT_ULTRA_THIN;
  /**
   * Search opacity.
   */
  searchOpacity?: number;
  /**
   * Search background color.
   */
  searchBackgroundColor?: ResourceColor;
  /**
   * Card bottom background blur style.
   */
  bottomBackgroundBlurStyle: BlurStyle = BlurStyle.COMPONENT_ULTRA_THIN;
  /**
   * Card background color.
   */
  backgroundColor: ResourceColor = '';
  /**
   * Background image.
   */
  backgroundImage?: ResourceStr;
  /**
   * ImageSize of background image.
   */
  backgroundImageSize?: ImageSize;
  /**
   * Card bottom item.
   */
  bottomItemList: BottomItem[] = [];
  /**
   * The auxiliary font color.
   */
  auxiliaryTextColor?: ResourceColor;
  /**
   * The start color of card.
   */
  linearStartColor?: ResourceStr;
  /**
   * The end color of card.
   */
  linearEndColor?: ResourceStr;

  constructor(placeholder: ResourceStr, placeholderColor: ResourceColor, searchColor: ResourceColor,
    searchIcon: IconOptions, bottomBackgroundBlurStyle: BlurStyle, bottomItemList: BottomItem[],
    backgroundColor: ResourceColor, backgroundImage?: ResourceStr, backgroundImageSize?: ImageSize,
    searchBackgroundBlurStyle?: BlurStyle, searchOpacity?: number, searchBackgroundColor?: ResourceColor,
    auxiliaryTextColor?: ResourceColor, linearStartColor?: ResourceStr, linearEndColor?: ResourceStr) {
    this.placeholder = placeholder;
    this.placeholderColor = placeholderColor;
    this.searchColor = searchColor;
    this.searchIcon = searchIcon;
    this.searchBackgroundBlurStyle = searchBackgroundBlurStyle;
    this.bottomBackgroundBlurStyle = bottomBackgroundBlurStyle;
    this.bottomItemList = bottomItemList;
    this.backgroundColor = backgroundColor;
    this.backgroundImage = backgroundImage;
    this.backgroundImageSize = backgroundImageSize;
    this.searchOpacity = searchOpacity;
    this.searchBackgroundColor = searchBackgroundColor;
    this.auxiliaryTextColor = auxiliaryTextColor;
    this.linearStartColor = linearStartColor;
    this.linearEndColor = linearEndColor;
  }
}

export interface BottomItem {
  formLinkParam?: FormLinkOptions;
  title: ResourceStr;
  icon: ResourceStr;
}