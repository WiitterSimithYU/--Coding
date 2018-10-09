import { Platform, Dimensions } from 'react-native';
var { height, width } = Dimensions.get('window');

// 屏幕宽度
export const ScreenWidth = width;   
// 屏幕高度
export const ScreenHeight = height; 
// 横向间距
export const countcoordinatesX = (A)=>{
  return ScreenWidth * A / 320;
}; 
// 纵向间距
export const countcoordinatesY = (A)=>{
  return ScreenHeight * (A / 568);
}; 
// 是否是iPhoneX
export const isIphoneX = ()=>{
  const X_WIDTH = 375;
  const X_HEIGHT = 812;
  return 
  Platform.OS === 'ios' &&
        ((ScreenHeight === X_HEIGHT && ScreenWidth === X_WIDTH) ||
         (ScreenHeight === X_WIDTH && ScreenWidth === X_HEIGHT))
}
// 状态栏
export const StatusBarHeight = ()=>{
  if (isIphoneX()) {
    return 44
  }
  else {
    return 20
  }
}
// 导航栏
export const NavigationHeight = ()=>{
  return StatusBarHeight() + 44;
}
// 底部安全区域
export const SafeAreaBottomHeight = ()=>{
  if (isIphoneX()) {
    return 34;
  }
  else {
    return 0;
  }
}
/// Tabbar高度
export const TabbarHeight = ()=>{
  return SafeAreaBottomHeight + 64;
}


export const HeavyBGColor  = '#17508D'; 
export const BoldBGColor   = '#3872B1'; 
export const MediumBGColor = '#77B8FF'; 
export const LightBGColor  = '#9DCCFF'; 
export const ThinBGColor   = '#C3E0FF'; 

export const HeavyTextColor  = 'rgba(83,83,83,1)'; 
export const BoldTextColor   = 'rgba(115,115,115,1)'; 
export const MediumTextColor = 'rgba(181,181,181,1)'; 
export const LightTextColor  = 'rgba(197,197,197,1)'; 
export const ThinTextColor   = 'rgba(215,215,215,1)'; 

export const ColorBg   = 'rgba(50,50,50,1)';
export const ColorLine = 'rgba(200,200,200,0.3)'
