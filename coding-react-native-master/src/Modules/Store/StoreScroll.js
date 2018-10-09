import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  ScrollView
} from 'react-native';
import StoreSectionHeader from './StoreSectionHeader';
import StoreSummaryView from './StoreSummaryView';
import StoreCategoryView from './StoreCategoryView';
import StoreDetailView from './StoreDetailView';
import { ScreenWidth, ScreenHeight, ColorBg } from '../../Define/PublicMacros';

export default class StoreScroll extends Component {

  // Scroll滚动完
  _onMomentumScrollEnd = (event)=>{
    var page = event.nativeEvent.contentOffset.x / ScreenWidth
    this.props.onMomentumScrollEnd(page);
  }
  // 滚动
  setScrollTo = (page)=>{
    this.refs.scroll.scrollTo({x: page * ScreenWidth, y: 0, animated: true})
  }
  // 子控件
  subview() {
    var arr = [];
    for (let i=0; i<10; i++) {
      arr.push(
        <ScrollView 
          key={i}
          showsVerticalScrollIndicator={false}
          style={styles.scroll}
        >
          <StoreSectionHeader/>
          <StoreSummaryView/>
          <StoreSectionHeader/>
          <StoreCategoryView/>
          <StoreSectionHeader/>
          <StoreDetailView/>
        </ScrollView>
      )
    }
    return arr;
  }
  // 初始化
  render() {
    return (
      <View style={styles.container}>
        <ScrollView 
          ref={"scroll"}
          horizontal={true} 
          pagingEnabled={true}
          style={{backgroundColor: ColorBg}}
          onMomentumScrollEnd={this._onMomentumScrollEnd}
        >
          {this.subview()}
        </ScrollView>
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
  },
  scroll: {
    // width: ScreenWidth,
    // height: ScreenHeight,
    // top: -ScreenHeight / 2,
    backgroundColor: ColorBg,
    // position: 'absolute',
  }
});
