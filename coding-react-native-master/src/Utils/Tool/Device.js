

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  View,
  Text,
  ScrollView,
  Animated,
} from 'react-native';
// 控件
import { ScreenWidth, ScreenHeight } from '../public/Public';
import DeviceInfo from 'react-native-device-info';

class Device extends Component {


  constructor(props) {
    super(props);
    this.state = {
      isPinOrFingerprintSet: ''
    }
  }


  componentDidMount() {
    this.isPinOrFingerprintSet();
  }

  onlyAndroid() {
    if (Platform.OS == 'android') {
      return (
        <View>
          <View style={styles.view}>
            <Text>API Level: {DeviceInfo.getAPILevel()}</Text>
          </View>
          <View style={styles.view}>
            <Text>App Instance ID: {DeviceInfo.getInstanceID()}</Text>
          </View>
          <View style={styles.view}>
            <Text>Phone Number: {DeviceInfo.getPhoneNumber()}</Text>
          </View>
          <View style={styles.view}>
            <Text>First Install Time: {DeviceInfo.getFirstInstallTime()}</Text>
          </View>
          <View style={styles.view}>
            <Text>Last Install Time: {DeviceInfo.getLastUpdateTime()}</Text>
          </View>
          <View style={styles.view}>
            <Text>Serial Number: {DeviceInfo.getSerialNumber()}</Text>
          </View>
          {/* <View style={styles.view}>
            <Text>IP Address: {DeviceInfo.getIPAddress()}</Text>
          </View>
          <View style={styles.view}>
            <Text>MAC Address: {DeviceInfo.getMACAddress()}</Text>
          </View> */}
        </View>
      )
    }
  }

  isPinOrFingerprintSet() {
    DeviceInfo.isPinOrFingerprintSet()(isPinOrFingerprintSet => {
      this.setState({
        isPinOrFingerprintSet: isPinOrFingerprintSet == true ? '是' : '否'
      })
    })
  }

  render() {
    return (
      <View style={styles.container}>
        <ScrollView style={styles.scroll}>
          <View style={styles.view}>
            <Text>设备唯一ID:</Text>
            <Text>{DeviceInfo.getUniqueID()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备制造商: {DeviceInfo.getManufacturer()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备品牌: {DeviceInfo.getBrand()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备模型: {DeviceInfo.getModel()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备ID: {DeviceInfo.getDeviceId()}</Text>
          </View>
          <View style={styles.view}>
            <Text>系统名称: {DeviceInfo.getSystemName()}</Text>
          </View>
          <View style={styles.view}>
            <Text>系统型号: {DeviceInfo.getSystemVersion()}</Text>
          </View>
          <View style={styles.view}>
            <Text>Bundle ID: {DeviceInfo.getBundleId()}</Text>
          </View>
          <View style={styles.view}>
            <Text>Build Number: {DeviceInfo.getBuildNumber()}</Text>
          </View>
          <View style={styles.view}>
            <Text>App版本: {DeviceInfo.getVersion()}</Text>
          </View>
          <View style={styles.view}>
            <Text>App版本: {DeviceInfo.getReadableVersion()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备名: {DeviceInfo.getDeviceName()}</Text>
          </View>
          <View style={styles.view}>
            <Text>User Agent: {DeviceInfo.getUserAgent()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备区域: {DeviceInfo.getDeviceLocale()}</Text>
          </View>
          <View style={styles.view}>
            <Text>设备国家: {DeviceInfo.getDeviceCountry()}</Text>
          </View>
          <View style={styles.view}>
            <Text>时区: {DeviceInfo.getTimezone()}</Text>
          </View>
          <View style={styles.view}>
            <Text>是否是模拟器: {DeviceInfo.isEmulator() == true ? '是' : '否'}</Text>
          </View>
          <View style={styles.view}>
            <Text>是否是平板: {DeviceInfo.isTablet() == true ? '是' : '否'}</Text>
          </View>
          <View style={styles.view}>
            <Text>PIN或指纹集: {this.state.isPinOrFingerprintSet}</Text>
          </View>
          {this.onlyAndroid()}
        </ScrollView>
      </View>
    );
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingLeft:20,
    paddingBottom: 20,
    paddingTop: 20,
  },
  scroll: {
    flex: 1,
  },
  view: {
    paddingTop: 3,
  }
});


// 连接组件 
export default Device;