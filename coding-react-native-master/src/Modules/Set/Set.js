import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  SectionList,
} from 'react-native';
import SetHeader from './SetHeader';
import SetSectionFooter from './SetSectionFooter';
import NavigationBar from '../../Utils/Util/NavigationBar/NavigationBar';
import KKCell, { KKCellStyle } from '../../Utils/Util/KKCell/KKCell';

export default class Set extends Component {
  // 构造器
  constructor(props) {
    super(props);
    this.state = {
      names: [
        {
          data: [
            {key: '0', name: '设置'},
            {key: '1', name: '个人换肤'},
            {key: '2', name: '夜间模式'},
            {key: '3', name: '定时关闭'}
          ],
          title: '标题'
        },
        {
          data: [
            {key: '4', name: '分享这个App'},
          ],
          title: '标题'
        }
      ]
    }
  }

  _onPress = (item)=>{
    console.log(item.name);
  }
  _ListHeaderComponent = ()=>{
    return (
      <SetHeader/>
    )
  }
  _renderSectionFooter = (section)=>{
    return (
      <SetSectionFooter/>
    )
  }
  _renderItem = (item)=>{
    return (
      <KKCell 
        key={item.key}
        cell_style={KKCellStyle.detail}
        name={item.name}
        icon={""}
        onPress={()=>this._onPress(item)}
      />
    )
  }
  render() {
    return (
      <View style={styles.container}>
        <NavigationBar name={"设置"}/>
        <SectionList
          style={styles.list}
          renderItem={({item}) => this._renderItem(item)}
          renderSectionFooter={({section}) => this._renderSectionFooter(section)}
          ListHeaderComponent={this._ListHeaderComponent}
          sections={this.state.names}
          showsVerticalScrollIndicator={false}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
  },
  list: {
    backgroundColor: 'white'
  }
});
