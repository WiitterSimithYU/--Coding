import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  ScrollView
} from 'react-native';
import StoreBar from './StoreBar';
import StoreScroll from './StoreScroll';
import Search from '../Search/Search';
import Channels from '../Channels/Channels';
import { ScreenWidth, ScreenHeight, ColorBg } from '../../Define/PublicMacros';

export default class Store extends Component {

  // 构造器
  constructor(props) {
    super(props);
    this.state = {
      isShowChannels: false,
      isShowSearch: false,
    };
  }

  // Btn点击
  _onBarPress = (index)=>{
    this.refs.scroll.setScrollTo(index)
  }
  // Scroll滚动完
  _onScrollEnd = (page)=>{
    this.refs.bar.btnClick(page)
  }
  // 搜索框成为焦点
  _onFocus = ()=>{
    console.log('onFocus')
    this.setState({
      isShowSearch: true
    })
  }
  // 搜索框失去焦点
  _onBlur = ()=>{
    this.setState({
      isShowSearch: false
    })
  }
  // 点击频道
  _onChannelsClick = ()=>{
    // this.setState({
    //   isShowChannels: true
    // })

    const { navigate } = this.props.navigation;
    navigate("Channels");
  }

  componentDidMount() {
    // this.setState({
    //   isShowChannels: true
    // })
  }

  search = ()=>{
    if (this.state.isShowSearch == true) {
      return (
        <Search onScroll={()=>{
          this.refs.bar.cancleBlur()
        }}/>
      )
    } 
  }

  render() {
    return (
      <View style={styles.container}>
        <StoreBar 
          ref={"bar"} 
          onPress={this._onBarPress}
          onFocus={this._onFocus}
          onBlur={this._onBlur}
          onChannelsClick={this._onChannelsClick}
        />
        <StoreScroll ref={"scroll"} onMomentumScrollEnd={this._onScrollEnd}/>
        {this.search()}
        {this.state.isShowChannels == true ? <Channels/> : <View/>}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'flex-start',
    backgroundColor: '#F5FCFF',
  }
});
