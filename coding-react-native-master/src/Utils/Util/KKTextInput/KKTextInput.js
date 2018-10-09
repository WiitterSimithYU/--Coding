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
import { ScreenWidth, NavigationHeight, countcoordinatesX, ColorBg } from '../../../Define/PublicMacros';

/// 输入框
export default class KKTextInput extends Component {

  // 获取输入框
  getTextInput = ()=>{
    return this.refs.textInput;
  }
  // 是否显示图片
  isShowIcon = (imageStr)=>{
    if (imageStr != undefined) {
      return {
        width: 20
      }
    }
    else {
      return {
        width: 0
      }
    }
  }
  // 取消焦点
  cancle = ()=>{
    this.refs.textInput.blur();
  }
  // 初始化
  render() {
    return (
      <Animated.View style={[this.props.prop_style, styles.container]}>
        <Image 
          style={[styles.icon, this.isShowIcon(this.props.leftImage)]}
          source={{uri: this.props.leftImage}}
        />
        <TextInput 
          ref={"textInput"}
          style={styles.input}
          onFocus={this.props.onFocus}
          onBlur={this.props.onBlur}
          placeholder={this.props.placeholder}
        />
      </Animated.View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  input: {
    flex: 1,
  },
  icon: {
    height: 20,
    marginLeft: countcoordinatesX(10),
    marginRight: countcoordinatesX(5),
  }
});
