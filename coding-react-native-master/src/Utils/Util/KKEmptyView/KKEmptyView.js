import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';
import { ScreenWidth, NavigationHeight, countcoordinatesX, ColorLine, MediumTextColor } from '../../../Define/PublicMacros';
import UITool from '../../Tool/UITool';

// 子控件
export default class KKEmptyView extends Component {
  // 构造器
  constructor(props) {
    super(props);
    // 设置初始的状态
    this.state = {
      /**
       * 0: 加载中
       * 1: 请求失败
       * 2: 无数据
       */
      status: 2
    };
  }

  componentDidMount() {
    this.setState({
      status: this.props.status
    })
  }

  setStatus = (index)=>{
    this.setState({
      status: index
    })
  }
  getState = ()=>{
    if (this.state.status == 0) {
      return (
        <Text style={styles.text}>数据加载中...</Text>
      )
    }
    else if (this.state.status == 1) {
      return (
        <TouchableOpacity 
          onPress={()=>this.props.onPress(this.state.status)} 
          activeOpacity={0.9}
        >
          <Image 
            style={styles.icon}
            resizeMode={"contain"}
            source={require('../../../Resources/Images/00currency_icon49-2.png')}
          />
        </TouchableOpacity>
      )
    }
    else if (this.state.status == 2) {
      return (
        <TouchableOpacity 
        onPress={()=>this.props.onPress(this.state.status)} 
          activeOpacity={0.9}
        >
          <Image 
            style={styles.icon}
            resizeMode={"contain"}
            source={require('../../../Resources/Images/00currency_icon48-2.png')}
          />
        </TouchableOpacity>
      )
    }
  }
  render() {
    return (
        <View style={styles.container}>
          {this.getState()}
        </View>
    )
  }
}

const styles = StyleSheet.create({
  // 父控件
  container: {
    flex: 1,
    backgroundColor: 'rgba(250,250,250,1)',
    position: 'absolute',
    left: 0,
    top: 0,
    right: 0,
    bottom: 0,
    justifyContent: 'center',
    alignItems: 'center'
  },
  text: {
    color: MediumTextColor
  },
  icon: {
    width: ScreenWidth / 4, 
    height: ScreenWidth / 4 + 30
  }
});

