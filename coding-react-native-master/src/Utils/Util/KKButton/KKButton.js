import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity
} from 'react-native';

var ButtonStyle = {
  "Left" : 0, 
  "Right" : 1, 
};

export default class KKButton extends Component {

  name() {
    if (this.props.name) {
      return (
        <Text key={0} style={this.props.name_style}>{this.props.name}</Text>
      )
    }
  }
  icon() {
    if (this.props.icon) {
      return (
        <Image 
          key={1}
          style={[styles.icon, this.props.icon_style]}
          source={{uri: this.props.icon}}
        />
      )
    }
  }
  padding() {
    return (
      <View 
        key={2}
        style={{width: 3}}
      />
    )
  }
  

  content = ()=>{
    var arr = [];
    if (this.props.button_style == ButtonStyle.Left) {
      arr.push(this.name())
    } else {
      arr.push(this.icon())
    }
    arr.push(this.padding())
    if (this.props.button_style == ButtonStyle.Left) {
      arr.push(this.icon())
    } else {
      arr.push(this.name())
    }
    return arr
  }
  render() {
    return (
      <TouchableOpacity 
        style={[styles.touch, this.props.prop_style]} 
        onPress={this.props.onPress}
        activeOpacity={0.9}
      >
        <View style={styles.container}>
          {this.content()}
        </View>
      </TouchableOpacity>
    );
  }
}

const styles = StyleSheet.create({
  touch: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingLeft: 5,
    paddingRight: 5,
  },
  icon: {
    width: 20,
    height: 20,
  }
});



export {ButtonStyle}