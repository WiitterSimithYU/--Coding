import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  FlatList
} from 'react-native';
import KKCell, { KKCellStyle } from '../../Utils/Util/KKCell/KKCell';
import NavigationBar from '../../Utils/Util/NavigationBar/NavigationBar';

export default class Mine extends Component {

  // 构造器
  constructor(props) {
    super(props);
    this.state = {
      names: [
        {key: '0', name: '本地音乐'},
        {key: '1', name: '最近播放'},
        {key: '2', name: '我的收藏'}
      ]
    };
  }
  
  
  _onPress = (item)=>{
    
  }
  _renderItem = (item)=>{
    return (
      <KKCell 
        key={item.key}
        cell_style={KKCellStyle.detail} 
        name={item.name} 
        desc={"0"}
        onPress={()=>this._onPress(item)}
      />
    )
  }
  render() {
    return (
      <View style={styles.container}>
        <NavigationBar name={"我的音乐"}/>
        <FlatList
          data={this.state.names}
          renderItem={({item}) => this._renderItem(item)}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
  }
});
