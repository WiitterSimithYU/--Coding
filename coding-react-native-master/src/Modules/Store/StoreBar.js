import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  Image,
  Animated
} from 'react-native';
import { ScreenWidth, countcoordinatesX, countcoordinatesY, ColorBg, StatusBarHeight } from '../../Define/PublicMacros';
import KKTextInput from '../../Utils/Util/KKTextInput/KKTextInput';
import KKSegmentBar from '../../Utils/Util/KKSegmentBar/KKSegmentBar';
import KKButton, { ButtonStyle } from '../../Utils/Util/KKButton/KKButton';
const padding = countcoordinatesX(15);

export default class StoreBar extends Component {

  // 构造器
  constructor(props) {
    super(props);
    this.state = {
      width: new Animated.Value(ScreenWidth - padding * 2)
    };
  }

  // 成为焦点
  _onFocus = ()=>{
    this.props.onFocus()
    Animated.spring(this.state.width,{ 
      bounciness: 5,
      speed: 9,
      toValue: ScreenWidth - padding * 2 - 40
    }).start((result)=>{
      
    });
  }
  // 取消焦点
  _onBlur = ()=>{
    
  }
  // 点击取消
  _onCancleClick = ()=>{
      this.refs.textInput.cancle()
      this.props.onBlur()
      Animated.spring(this.state.width,{ 
        bounciness: 5,
        speed: 9,
        toValue: ScreenWidth - padding * 2
      }).start((result)=>{
        
      });
  }

  componentDidMount() {
    
  }
  // 取消焦点
  cancleBlur = ()=>{
    this.refs.textInput.cancle()
  }
  // btn点击
  btnClick = (index)=>{
    this.refs.bar.btnClick(index);
  }
  render() {
    return (
      <View style={styles.container}>
        {/* 搜索栏 + 取消 */}
        <View style={styles.top}>
          {/* 搜索栏 */}
          <KKTextInput 
            ref="textInput"
            prop_style={[styles.input, {
              width: this.state.width
            }]}
            placeholder={"搜索音乐"}
            onFocus={this._onFocus}
            onBlur={this._onBlur}
            leftImage={"search_in_12x12_"}
          />
          {/* 取消 */}
          <KKButton 
            name={"取消"}
            prop_style={styles.cancle}
            onPress={this._onCancleClick}
          />
        </View>
        {/* 滚动条 + 按钮 */}
        <View style={styles.bottom}>
          {/* 滚动条 */}
          <KKSegmentBar 
            ref={"bar"}
            prop_style={styles.bar}
            onPress={this.props.onPress}
          />
          {/* 目录 */}
          <KKButton 
            icon={"btn_menu"}
            button_style={ButtonStyle.Left}
            onPress={this.props.onChannelsClick}
          />
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: ScreenWidth,
    backgroundColor: ColorBg,
    paddingLeft: padding,
  },
  top: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'red',
    marginTop: StatusBarHeight(),
  },
  input: {
    height: 35,
    backgroundColor: 'white',
    borderRadius: 3,
  },
  cancle: {
    marginLeft: countcoordinatesX(10),
    backgroundColor: 'green',
    height: 35
  },
  bottom: {
    width: ScreenWidth - padding,
    height: 30,
    flexDirection: 'row',
  },
  button: {

  }
});
