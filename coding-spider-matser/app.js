const fs = require('fs');
/**
#define NEW_SONG_LIST           1   新歌
#define HOT_SONG_LIST           2   热歌
#define OLD_SONG_LIST           22  经典
#define LOVE_SONG_LIST          23  情歌
#define INTERNET_SONG_LIST      25  网络
#define MOVIE_SONG_LIST         24  影视
#define EUROPE_SONG_LIST        21  欧美
#define BILLBOARD_MUSIC_LIST    8   Bill
#define ROCK_MUSIC_LIST         11  摇滚
#define JAZZ_MUSIC_LIST         12  爵士
#define POP_MUSIC_LIST          16  流行
 */
// 列表地址
// http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=%d&offset=0&size=20

// 具体歌的地址
// http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.song.play&songid=


var {connectDB, insertDate, createCollection} = require('./mongdb');
var {startSpider} = require('./spider');
var {createFileDir, downloadFiles, downloadFile} = require('./file');

var spider = async ()=>{
    // 文件夹
    await createFileDir('resources');
    // 开始爬取数据
    var datas = await startSpider();
    // console.log(datas);
    // 连接数据库
    await connectDB();
    // 集合
    await createCollection('list');
    await createCollection('song');
    await insertDate('list', datas.list);
    await insertDate('song', datas.song);
    // 下载文件
    await downloadFiles(datas.song);
}

spider();








