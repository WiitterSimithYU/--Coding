

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  View,
  Text,
  ScrollView,
  Animated,
  AsyncStorage
} from 'react-native';
import Storage from 'react-native-storage';
// 控件
import Button from '../common/Button/Button';
import { ScreenWidth, ScreenHeight } from '../public/Public';

var storage = new Storage({
  // 最大容量，默认值1000条数据循环存储
  size: 1000,
  // 存储引擎：对于RN使用AsyncStorage，对于web使用window.localStorage
  // 如果不指定则数据只会保存在内存中，重启后即丢失
  storageBackend: AsyncStorage,
  // 数据过期时间，默认一整天（1000 * 3600 * 24 毫秒），设为null则永不过期
  defaultExpires: 1000 * 3600 * 24,
  // 读写时在内存中缓存数据。默认启用。
  enableCache: true,
  // 如果storage中没有相应数据，或数据已过期，
  // 则会调用相应的sync方法，无缝返回最新数据。
  // sync方法的具体说明会在后文提到
  // 你可以在构造函数这里就写好sync的方法
  // 或是在任何时候，直接对storage.sync进行赋值修改
  // 或是写到另一个文件里，这里require引入
  sync: {
    // sync方法的名字必须和所存数据的key完全相同
    // 方法接受的参数为一整个object，所有参数从object中解构取出
    // 这里可以使用promise。或是使用普通回调函数，但需要调用resolve或reject。
    loginState(params) {
      let { id, resolve, reject, syncParams: { extraFetchOptions, someFlag } } = params;
      let json = {
        key: 'loginState',  // 注意:请不要在key中使用_下划线符号!
        data: { 
          from: 'data.from 新数据',
          userid: 'data.userid 新数据',
          token: 'data.token 新数据'
        },
      }

      storage.save({
        key: 'loginState',
        data: json.data
      });

      if (json != undefined) {
        resolve && resolve(json);
      } else {
        reject && reject(new Error('data parse error'));
      }
    },
    user(params) {
      let { id, resolve, reject, syncParams: { extraFetchOptions, someFlag } } = params;

      let json = {
        key: 'user',  // 注意:请不要在key中使用_下划线符号!
        id: '1001',
        data: { 
          from: 'data.from ' + '1001 ' + '新数据',
          userid: 'data.userid ' + '1001 ' + '新数据',
          token: 'data.token ' + '1001 ' + '新数据'
        },
      }

      console.log(id);
      storage.save({
        key: 'user',
        id: '1001',
        data: { 
          from: 'data.from 1001 新数据',
          userid: 'data.userid 1001 新数据',
          token: 'data.token 1001 新数据'
        }
      });
      // storage.save({
      //   key: 'user',
      //   id: '1002',
      //   data: { 
      //     from: 'data.from 1002 新数据',
      //     userid: 'data.userid 1002 新数据',
      //     token: 'data.token 1002 新数据'
      //   }
      // });

      if (json != undefined) {
        resolve && resolve(json);
      } 
      else {
        reject && reject(new Error('data parse error'));
      }
    }
  }
  	
})  

class KKStorage extends Component {

  constructor(props) {
    super(props);
    this.state = {
      value1: '',
      text: '',
    }
  }

  //========================= 操作key =========================//
  // 存值
  _save_key=(time)=>{
    /**
     * 使用key来保存数据。这些数据一般是全局独有的，常常需要调用的。
     * 除非你手动移除，这些数据会被永久保存，而且默认不会过期。
     */
    storage.save({
      key: 'loginState',  // 注意:请不要在key中使用_下划线符号!
      data: { 
        from: 'data.from 旧数据',
        userid: 'data.userid 旧数据',
        token: 'data.token 旧数据'
      },
      /**
       * 如果不指定过期时间，则会使用defaultExpires参数
       * 如果设为null，则永不过期
       */
      expires: 1000 * time
    });


    this.setState({ 
      value1: '数据已存储' 
    });

  }
  // 取值
  _load_key=()=>{
    // 读取
    storage.load({
      key: 'loginState',
      // autoSync(默认为true)意味着在没有找到数据或数据过期时自动调用相应的sync方法
      autoSync: true,
      // syncInBackground(默认为true)意味着如果数据过期，
      // 在调用sync方法的同时先返回已经过期的数据。
      // 设置为false的话，则等待sync方法提供的最新数据(当然会需要更多时间)。
      syncInBackground: true,
      // 你还可以给sync方法传递额外的参数
      syncParams: {
        extraFetchOptions: {
        // 各种参数
        },
        someFlag: true,
      },
    }).then(ret => {
      // 如果找到数据，则在then方法中返回
      // 注意：这是异步返回的结果
      // 你只能在then这个方法内继续处理ret数据
      // 而不能在then以外处理
      // 也没有办法“变成”同步返回
      // 你也可以使用“看似”同步的async/await语法
      
      console.log(ret.userid);
      this.setState({ 
        value1: ret.userid
      });
    }).catch(err => {
      // 如果没有找到数据且没有sync方法，
      // 或者有其他异常，则在catch中返回
      this.setState({ 
        value1: 'err: ' + err.name
      });

      switch (err.name) {
        case 'NotFoundError':
        // TODO;
        break;
        case 'ExpiredError':
        // TODO
        break;
      }
    })
  }
  // 删除值
  _delete_key=()=>{
    // 删除单个数据
    storage.remove({
      key: 'loginState'
    });
    this.setState({ 
      value1: '数据已删除'
    });
  }

  //========================= 操作key,id =========================//
  // 存值
  _save_key_id=(time)=>{
    /**
     * 使用key和id来保存数据，一般是保存同类别（key）的大量数据。
     * 所有这些"key-id"数据共有一个保存上限（无论是否相同key）
     * 即在初始化storage时传入的size参数。
     * 在默认上限参数下，第1001个数据会覆盖第1个数据。
     * 覆盖之后，再读取第1个数据，会返回catch或是相应的sync方法。
     */
    storage.save({
      key: 'user',
      id: '1001',
      data: { 
        from: 'data.from 1001 旧数据',
        userid: 'data.userid 1001 旧数据',
        token: 'data.token 1001 旧数据'
      },
      expires: 1000 * time
    });

    storage.save({
      key: 'user',
      id: '1002',
      data: { 
        from: 'data.from 1002 旧数据',
        userid: 'data.userid 1002 旧数据',
        token: 'data.token 1002 旧数据'
      },
      expires: 1000 * time
    });

    this.setState({ 
      value2: '数据已存储' 
    });

  }
  // 取值
  _load_key_id=()=>{
    storage.load({
      key: 'user',
      id: '1001',
      autoSync: true,
      syncInBackground: true,
      syncParams: {
        extraFetchOptions: {
        },
        someFlag: true,
      },
    }).then(ret => {
      this.setState({ 
        value2: ret.userid
      });
    }).catch(err => {
      // 如果没有找到数据且没有sync方法，
      // 或者有其他异常，则在catch中返回
      this.setState({ 
        value2: err.name
      });
      switch (err.name) {
        case 'NotFoundError':
            // TODO;
            break;
        case 'ExpiredError':
            // TODO
            break;
      }
    })
  }
  // 取所有id
  _loadAll_key_id=()=>{
    // 获取某个key下的所有id(仅key-id数据)
    storage.getIdsForKey('user').then(ids => {
      console.log(ids)
      if (ids.length != 0) {
        this.setState({ 
          value2: ids[0]
        });
      } else {
        this.setState({ 
          value2: '数据没找到'
        });
      }
    });
  }
  // 取所有value
  _loadAll_key_value=()=>{
    // 获取某个key下的所有数据(仅key-id数据)
    storage.getAllDataForKey('user').then(users => {
      console.log(users)
      if (users.length != 0) {
        this.setState({ 
          value2: users[0].token
        });
      } else {
        this.setState({ 
          value2: '数据没找到'
        });
      }
    });
  }
  // 清除所有值
  _clearAll_key_value=()=>{
    storage.clearMapForKey('user');
  }
  // 清除值根据id
  _clearData_key_id=()=>{
    storage.remove({
      key: 'user',
      id: '1001'
    });
  }
  // 批量读取数据value
  _loadData_value=()=>{
    // 使用和load方法一样的参数读取批量数据，但是参数是以数组的方式提供。
    // 会在需要时分别调用相应的sync方法，最后统一返回一个有序数组。
    storage.getBatchData([
      { key: 'loginState' },
      { key: 'user', id: '1001'}
    ])
    .then(results => {
      results.forEach(result => {
        console.log(result); 	
      })
    })
  }
  // 批量读取数据id
  _loadData_id=()=>{
    // 根据key和一个id数组来读取批量数据
    storage.getBatchDataWithIds({
      key: 'user', 
      ids: ['1001', '1002']
    })
    .then(results => {
      results.forEach( result => {
        console.log(result); 	
      })
    })
  }
  

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>{this.state.value1}</Text>
        <Button style={styles.button}
                customView={<Text>存值1小时 -> key</Text>}
                onPress={()=>this._save_key(3600)}/>
        <Button style={styles.button}
                customView={<Text>存值2秒 -> key</Text>}
                onPress={()=>this._save_key(2)}/>
        <Button style={styles.button}
                customView={<Text>取值 -> key</Text>}
                onPress={this._load_key}/>
        <Button style={styles.button}
                customView={<Text>清除值 -> key</Text>}
                onPress={this._delete_key}/>
        
        <Text style={styles.text}>{this.state.value2}</Text>
        <Button style={styles.button}
                customView={<Text>存值1小时 -> key,id</Text>}
                onPress={()=>this._save_key_id(3600)}/>
        <Button style={styles.button}
                customView={<Text>存值2秒 -> key,id</Text>}
                onPress={()=>this._save_key_id(2)}/>
        <Button style={styles.button}
                customView={<Text>取值 -> key,id</Text>}
                onPress={this._load_key_id}/>
        <Button style={styles.button}
                customView={<Text>取所有id -> key,id</Text>}
                onPress={this._loadAll_key_id}/>
        <Button style={styles.button}
                customView={<Text>取所有值 -> key,value</Text>}
                onPress={this._loadAll_key_value}/>
        <Button style={styles.button}
                customView={<Text>清除所有值</Text>}
                onPress={this._clearAll_key_value}/>
        <Button style={styles.button}
                customView={<Text>清除值 -> key,id</Text>}
                onPress={this._clearData_key_id}/>
        <Button style={styles.button}
                customView={<Text>批量读数据 -> value</Text>}
                onPress={this._loadData_value}/>
        <Button style={styles.button}
                customView={<Text>批量读数据 -> id</Text>}
                onPress={this._loadData_id}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
  text: {
    marginTop: 10,
    marginLeft: 20,
    width: ScreenWidth - 40,
    height: 20,
    textAlign: 'center'
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
});


// 连接组件 
export default KKStorage;