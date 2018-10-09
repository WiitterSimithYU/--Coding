
const express = require('express')
const app = express()
const Ut = require('../../utils/common');
// const home_recommend = require('../juejin/home_recommend');

app.get('/home_list', async (req, res)=>{
  // var recommend = await home_recommend();
  var params = {
    'retCode': 0,
    'retMessage': '请求成功',
    // 广告
    'ad': [
      {
        'image': 'http://localhost:3003/images/1.jpeg',
        'url': 'https://www.baidu.com'
      },
      {
        'image': 'http://localhost:3003/images/2.jpeg',
        'url': 'https://www.baidu.com'
      },
      {
        'image': 'http://localhost:3003/images/3.jpeg',
        'url': 'https://www.baidu.com'
      }
    ],
    // 头条
    'headlines': [
      '知乎专栏突破10000',
      '奇点日报齐逼商城兑换商品',
      '程序是怎样跑起来的'
    ],
    // 技术点
    'technical': [
      {
        'image': 'document_16x18_',
        'name': '文档社区'
      },
      {
        'image': 'code_prodoct_20x17_',
        'name': '极客周边'
      },
      {
        'image': 'shop_19x17_',
        'name': '奇币商城'
      }
    ],
    // 分类 
    'sort': [
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '代码神图与神注释',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '不, 你可能不需要区块链',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '茴的四种写法----浅谈移动前端适配',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '推荐一些经典的而技术书籍给你们',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '哪个技术火就选那个? 热闹驱动开发的技术选型使不得',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '8个字体设计和排版技巧',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
    ],
    // 推荐
    'recommend': [
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '中兴的自毁与自救: 封杀7年, 禁用Android, 76岁创始人奔走前线!',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': 'iOS 11.3升级了, 那你的人升级了吗',
        'image': 'http://localhost:3003/images/recommend2.jpg',
        'number': 999,
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': 'Facebook迎来史上最严重水逆, 谁会成为媒体的新大',
        'image': 'http://localhost:3003/images/recommend3.png',
        'number': 3456,
      }
    ],
    // 热门
    'hot': [
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '你想知道我在看什么书吗?',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
        'tag': [
          {
            'id': '559a4c13e4b08a686d209b5b',
            'title': '其他'
          }
        ]
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '你想知道我在看什么书吗?',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
        'tag': [
          {
            'id': '559a4c13e4b08a686d209b5b',
            'title': '其他'
          }
        ]
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '你想知道我在看什么书吗?',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
        'tag': [
          {
            'id': '559a4c13e4b08a686d209b5b',
            'title': '其他'
          }
        ]
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '你想知道我在看什么书吗?',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
        'tag': [
          {
            'id': '559a4c13e4b08a686d209b5b',
            'title': '其他'
          }
        ]
      },
      {
        'objectId': '59a795baf265da2476424dfd',
        'title': '你想知道我在看什么书吗?',
        'image': 'http://localhost:3003/images/recommend1.png',
        'number': 111,
        'tag': [
          {
            'id': '559a4c13e4b08a686d209b5b',
            'title': '其他'
          }
        ]
      }
    ],
    // 组头试图
    'sectionHeader': [
      '最新资讯',
      '热门推荐'
    ],
    // 栏目
    'column': [
      {
        'id': 0,
        'name': '全部',
      },
      {
        'id': 1,
        'name': '前端',
      },
      {
        'id': 2,
        'name': 'iOS',
      },
      {
        'id': 3,
        'name': 'Android',
      },
      {
        'id': 4,
        'name': '工具资源',
      },
      {
        'id': 5,
        'name': '产品经理',
      },
      {
        'id': 6,
        'name': '设计',
      },
      {
        'id': 7,
        'name': 'PHP',
      },
      {
        'id': 8,
        'name': '小程序',
      },
      {
        'id': 9,
        'name': '其他',
      },
      {
        'id': 10,
        'name': '运营推广',
      },
      {
        'id': 11,
        'name': 'Java',
      },
      {
        'id': 12,
        'name': '架构',
      }
    ]
  }
  
  // await Ut.sleep(4000);  
  res.send(params);
})

module.exports = app
