import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  Image,
  ScrollView,
  Animated,
  TouchableOpacity
} from 'react-native';
import { ScreenWidth, NavigationHeight, countcoordinatesX, ColorBg } from '../../../Define/PublicMacros';
import UITool from '../../Tool/UITool';

// 子控件
class KKSegmentSubView extends Component {

  // 获取frame
  getFrame = async ()=>{
    var frame = await new Promise((resolve, reject)=>{
      this.refs.view.measure((x, y, width, height, left, top)=>{
        resolve({
          x: x,
          y: y,
          width: width,
          height: height,
          left: left,
          top: top
        });
      })
    });
    return frame;
  }

  render() {
    return (
        <View 
          style={styles.subview} 
          ref={"view"}
        >
          <TouchableOpacity 
            activeOpacity={0.9}
            style={{justifyContent: 'center', flex: 1}}
            onPress={this.props.onPress}
          >
            <Text style={[
              styles.text, {
                color: this.props.isChoose == true ? this.props.selectColor : this.props.normalColor
              }
            ]}>
              推荐
            </Text>
            </TouchableOpacity>
        </View>
    )
  }
}
// 底部那条线
class KKSegmentLine extends Component {
  // 构造器
  constructor(props) {
    super(props);
    // 设置初始的状态
    this.state = {
      width: 20,
      left: new Animated.Value(15)
    };
  }
  // 设置选中
  setSelect = (frame)=>{
    console.log(frame.left)
    var left = frame.x + (frame.width - this.state.width) / 2
    Animated.spring(this.state.left,{ 
      bounciness: 5,
      speed: 9,
      toValue: left
    }).start((result)=>{
      
    });
  }

  // 初始化
  render() {
    return (
      <Animated.View style={[styles.line, {
        width: this.state.width,
        left: this.state.left
      }]}/>
    )
  }
}
// 输入框
class KKSegmentBar extends Component {
  // 构造器

  constructor(props) {
    super(props);
    // 设置初始的状态
    this.state = {
      selectIndex: 0
    };
  }
  // 点击事件
  _onPress = async (index)=>{
    // 获取控件尺寸
    var frame = await this.refs["subview"+index].getFrame()
    // 选中
    await this.refs.line.setSelect(frame);
    await this.setState({
      selectIndex: index
    })
    // 滚动
    await UITool.layout(this.refs.scroll).then(data=>{
      var scrollContentW = frame.width * 10;
      var viewOffsetX = (data.width - frame.width) / 2;
      var offsetX = frame.x - viewOffsetX;
      offsetX = offsetX < 0 ? 0 : offsetX;
      offsetX = (frame.x + viewOffsetX + frame.width) > scrollContentW ? scrollContentW - data.width : offsetX 
      this.refs["scroll"].scrollTo({x: offsetX, y: 0, animated: true})
    })
    // 回调
    await this.props.onPress(index)
  }
  // btn点击
  btnClick = (index)=>{
    this._onPress(index);
  }
  // 子控件
  subview = ()=>{
    let arr = [];
    for (let i=0; i<10; i++) {
      var refStr = "subview" + i + "";
      arr.push(
        <KKSegmentSubView 
          key={i}
          ref={refStr}
          isChoose={i==this.state.selectIndex}
          normalColor={"green"}
          selectColor={"red"}
          onPress={()=>this._onPress(i)}
        />
      )
    }
    return arr;
  }
  // 初始化
  render() {
    return (
      <View style={[this.props.prop_style, styles.container]}>
        <ScrollView 
          ref={"scroll"}
          horizontal={true}
          showsHorizontalScrollIndicator={false}
        >
          {this.subview()}
          <KKSegmentLine ref={"line"}/>
        </ScrollView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  // 父控件
  container: {
    flex: 1,
  },
  // 子控件
  subview: {
    justifyContent: 'center',
    backgroundColor: 'yellow',
  },
  // 线条
  line: {
    height: 3,
    backgroundColor: 'orange',
    position: 'absolute',
    bottom: 2,
    borderRadius: 1.5,
  },
  // 文字
  text: {
    fontWeight: '700',
    color: 'white',
    paddingLeft: 10,
    paddingRight: 10,
    flex: 1 ,
    lineHeight: 30,
  }
});


export default KKSegmentBar;