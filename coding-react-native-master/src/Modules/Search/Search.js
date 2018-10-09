import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  SectionList
} from 'react-native';
import SearchHeader from './SearchHeader';
import SearchCell from './SearchCell';
import SearchSectionHeader from './SearchSectionHeader';
import { StatusBarHeight, ScreenWidth, countcoordinatesX } from '../../Define/PublicMacros';

export default class Search extends Component {

  // 组头视图
  _renderSectionHeader = (section)=>{
    return (
      <SearchSectionHeader name={section.title}/>
    )
  }

  // Cell
  _renderItem = (item)=>{
    return <SearchCell/>
  }

  render() {
    return (
      <View style={styles.container}>
        <SectionList
          renderItem={({item}) => this._renderItem(item)}
          renderSectionHeader={({section}) => this._renderSectionHeader(section)}
          stickySectionHeadersEnabled={false}
          ListHeaderComponent={() => <SearchHeader/>}
          sections={[ 
            {data: [{key: 'a'}, {key: 'b'}], title: '标题'},
          ]}
          onScroll={this.props.onScroll}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
    position: 'absolute',
    left: 0,
    bottom: 0,
    right: 0,
    top: StatusBarHeight() + 65,
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
});
