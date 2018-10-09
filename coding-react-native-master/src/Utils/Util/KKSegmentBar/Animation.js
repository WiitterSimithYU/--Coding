

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  View,
  Text,
  ScrollView,
  Animated,
  Easing,
  Image
} from 'react-native';
// 控件
import Button from '../common/Button/Button';
import { ScreenWidth, ScreenHeight, NavigationColor } from '../public/Public';


// 导航栏高度
const navigationH = Platform.select({
  ios: 44,
  android: 44,
});

class Animation extends Component {

  componentWillUnmount() {
    this.timer && clearTimeout(this.timer);
  }

  //======================== state =======================//
  constructor(props) {
    super(props);
    this.state = {
      desc: '动画未开始',
      timingAnim: new Animated.Value(20),
      opacityAnim: new Animated.Value(1),
      interAnim: new Animated.Value(1),
    }
  }
  startAnimation() {
    this.setState({
      desc: '动画开始'
    })
  }
  stopAnimation(result) {
    this.setState({
      desc: '动画结束: ' + (result.finished == true ? '已完成' : '未完成')
    })
  }

  //======================== 动画 ========================//
  // timing动画
  _timingAnimation=()=>{
    this.startAnimation()
    Animated.timing(this.state.timingAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: ScreenWidth - 60
    }).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
        })
      },100)
    });
  }
  // spring1动画
  _spring1Animation=()=>{
    this.startAnimation()
    Animated.spring(this.state.timingAnim,{ 
        bounciness: 10,
        speed: 9,
        toValue: ScreenWidth - 60
    }).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
        })
      },100)
    });
  }
  // spring2动画
  _spring2Animation=()=>{
    this.startAnimation()
    Animated.spring(this.state.timingAnim,{ 
        friction: 40,
        tension: 7,
        toValue: ScreenWidth - 60
    }).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
        })
      },100)
    });
  }
  // decay动画
  _decayAnimation=()=>{
    this.startAnimation()
    Animated.decay(this.state.timingAnim,{ 
        velocity: 0.26,
        deceleration: 0.999,
        toValue: ScreenWidth - 60
    }).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
        })
      },100)
    });
  }
  // parallel组合动画
  _parallelAnimation=()=>{
    this.startAnimation()
    Animated.parallel([   
      Animated.timing(this.state.timingAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: ScreenWidth - 60
      }),
      Animated.timing(this.state.opacityAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: 0
      })
    ]).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
          opacityAnim: new Animated.Value(1),
        })
      },100)
    })
  }
  // sequence组合动画
  _sequenceAnimation=()=>{
    this.startAnimation()
    Animated.sequence([   
      Animated.timing(this.state.timingAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: ScreenWidth - 60
      }),
      Animated.timing(this.state.opacityAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: 0
      })
    ]).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
          opacityAnim: new Animated.Value(1),
        })
      },100)
    })
  }
  // stagger组合动画
  _staggerAnimation=()=>{
    this.startAnimation()
    Animated.stagger(2000,[   
      Animated.timing(this.state.timingAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: ScreenWidth - 60
      }),
      Animated.timing(this.state.opacityAnim,{ 
        duration: 1000,
        easing: Easing.elastic(0),
        toValue: 0
      })
    ]).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          timingAnim: new Animated.Value(20),
          opacityAnim: new Animated.Value(1),
        })
      },100)
    })
  }
  // 插值动画
  _interpolateAnimation=()=>{
    this.startAnimation()
    Animated.timing(this.state.interAnim,{
        toValue: 0,
        duration: 2000,
    }).start((result)=>{
      this.stopAnimation(result)
      this.timer = setTimeout(()=>{
        this.setState ({
          interAnim: new Animated.Value(1),
        })
      },100)
    });
  }
  // 停止动画
  _stopAnimation=()=>{
    this.state.timingAnim.stopAnimation((result)=>{
      
    })
    this.state.opacityAnim.stopAnimation((result)=>{
      
    })
    this.state.interAnim.stopAnimation((result)=>{
      
    })
  }


  render() {
    return (
      <View style={styles.container}>
        <Animated.View style={[styles.image, {
                      left: this.state.timingAnim, 
                      opacity: this.state.opacityAnim,
                      transform: [
                        {
                          translateX: this.state.interAnim.interpolate({
                                        inputRange: [0, 0.5, 0.8, 1],
                                        outputRange: [200, 100, 150, 0] 
                                      })
                        },
                        {
                          scale:this.state.interAnim
                        }
                      ],
                  }]}/>
        <Text style={styles.desc}>{this.state.desc}</Text>
        <View style={styles.scroll}>
          <Button style={styles.button}
                  customView={<Text>timing动画</Text>}
                  onPress={this._timingAnimation}/>
          <Button style={styles.button}
                  customView={<Text>spring1动画</Text>}
                  onPress={this._spring1Animation}/>
          <Button style={styles.button}
                  customView={<Text>spring2动画</Text>}
                  onPress={this._spring2Animation}/>
          <Button style={styles.button}
                  customView={<Text>decay动画</Text>}
                  onPress={this._decayAnimation}/>
          <Button style={styles.button}
                  customView={<Text>parallel组合动画</Text>}
                  onPress={this._parallelAnimation}/>
          <Button style={styles.button}
                  customView={<Text>sequence组合动画</Text>}
                  onPress={this._sequenceAnimation}/>
          <Button style={styles.button}
                  customView={<Text>stagger组合动画</Text>}
                  onPress={this._staggerAnimation}/>
          <Button style={styles.button}
                  customView={<Text>插值动画</Text>}
                  onPress={this._interpolateAnimation}/>
          <Button style={styles.button}
                  customView={<Text>停止动画</Text>}
                  onPress={this._stopAnimation}/>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  scroll: {
    flex: 1,
    height: ScreenHeight - 64 - 250,
    width: ScreenWidth,
    marginBottom: 40,
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  button: {
    width: (ScreenWidth - 20 - 10) / 2, 
    backgroundColor: '#bbb',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 10,
    marginTop: 10,
    marginBottom: 10,
    marginLeft: 10,
  },
  image: {
    width: 40,
    height: 40,
    backgroundColor: NavigationColor,
    alignSelf: 'flex-start',
    marginTop: 10,
    marginLeft: 10,
  },
  desc: {
    marginTop: 10,
    marginBottom: 10,
    height: 20,
  }
});


// 连接组件 
export default Animation;