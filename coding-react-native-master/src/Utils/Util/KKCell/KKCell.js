import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  Switch,
  TouchableOpacity
} from 'react-native';
import { countcoordinatesX, LightTextColor, BoldTextColor } from '../../../Define/PublicMacros';

var KKCellStyle = {
  "detail" : 0, 
  "switch" : 1, 
};

export default class KKCell extends Component {

  left = ()=>{
    return (
      <View style={styles.left}>
        <Image style={styles.icon}/>
        <Text style={styles.name}>{this.props.name}</Text>
      </View>
    )
  }
  right = ()=>{
    if (this.props.cell_style == KKCellStyle.detail) {
      return (
        <View style={styles.right}>
        <Text style={styles.desc}>{this.props.desc}</Text>
          <Image style={styles.next}/>
        </View>
      )
    } else if (this.props.cell_style == KKCellStyle.switch) {
      return (
        <Switch onTintColor={'red'}/>
      )
    }
  }
  render() {
    return (
      <TouchableOpacity activeOpacity={0.9} onPress={this.props.onPress}>
        <View style={styles.container}>
          {this.left()}
          {this.right()}
        </View>
      </TouchableOpacity>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#F5FCFF',
    height: 40,
    flexDirection: 'row',
    alignItems: 'center',
    paddingLeft: countcoordinatesX(10),
    paddingRight: countcoordinatesX(10),
    justifyContent: 'space-between'
  },
  left: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  right: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  icon: {
    width: 20,
    height: 20,
    backgroundColor: 'red'
  },
  name: {
    paddingLeft: countcoordinatesX(5),
    color: BoldTextColor
  },
  desc: {
    paddingRight: countcoordinatesX(5),
    color: LightTextColor,
  },
  next: {
    width: 20,
    height: 20,
    backgroundColor: 'red'
  }
});


export { KKCellStyle }