
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/runoob";
var {KHost} = require('./define');

var _db;
var _dbase;

// 链接数据库
var connectDB = ()=>{
    return new Promise((resolve, reject)=>{
        MongoClient.connect(url, (err, db)=> {
            // 连接失败
            if (err) {
                console.log('连接数据库失败');
                reject(false);
            }
            // 连接成功
            else {
                _db = db;
                console.log('连接数据库成功');
                resolve(true);
            }
        });
    })
}
// 创建集合
var createCollection = (data, err, res)=>{
    return new Promise(async (resolve, reject)=>{
        _dbase = await _db.db("runoob");
        // 不知道怎么判断是否有集合了
        await removeData(data);
        await _dbase.createCollection(data, (err, res)=>{
            if (err) {
                console.log("创建合集: " + data + " 失败")
                reject();
            } else {
                console.log("创建合集: " + data + " 成功")
                resolve();
            }
        });
    })
}
// 读取列表
var readListData = (lid)=>{
    return new Promise((resolve, reject)=>{
        _dbase = _db.db("runoob");
        var cursor = _dbase.collection('list').find({"lid": lid});
        var data;
        cursor.each((err, doc)=>{
            if (err) {
                reject(data);
            }
            if (doc != null) {
                data = doc;
            } else {
                resolve(data);
            }
        });
    })
}
// 读取歌曲
var readSongData = (songid)=>{
    return new Promise((resolve, reject)=>{
        _dbase = _db.db("runoob");
        var cursor = _dbase.collection('song').find({songid: parseInt(songid)})
        var data;
        cursor.each((err, doc)=>{
            if (err) {
                data = {'retCode': 1, 'retMessage': '哈哈哈'};
                reject(data);
            }
            if (doc != null) {
                data = doc;
            }
            else {
                if (data == undefined) {
                    data = {'retCode': 1, 'retMessage': '哈哈哈'};
                }
                resolve(data);
            }
        });
    })
}
// 添加数据
var insertDate = (base, data)=>{
    return new Promise((resolve, reject)=>{
        _dbase.collection(base).insertMany(data, (err, result)=>{ 
            if (err) {  
                console.log('添加数据 ' + base + '失败');
                reject();
            } 
            else {
                console.log('添加数据 ' + base + ' 成功');
                resolve();
            }
        });  
    });
}
// 删除数据
var removeData = (base)=>{
    _dbase = _db.db("runoob");
    _dbase.collection(base).drop()
    console.log("删除集合: " + base + " 完成");
}
// 写假数据
var insertSomeData = ()=>{
    var names = [
        "爱不得 恨不得 舍不得","爱的代价","爱了很久的朋友","半壶纱","初恋的地方","大王叫我来巡山",
        "大中国","当爱已成往事","独孤天下","凡人歌","飞云之下","风雨无阻","橄榄树","红颜旧",
        "后来","后来的我们（电影《后来的我们》片名曲）","狐狸（电影《二代妖精之今生有幸》推广曲）",
        "恍若年少","灰姑娘","几乎成名","寂寞的人伤心的歌","空空如也(Cover 胡66)","老古董",
        "恋恋风尘","领悟","摩天大楼","內疚","你不来我不老 (对唱版)","你还要我怎样","你是我今生的依靠",
        "你怎么舍得我难过","菩提偈","起床歌","三的颜色","伤心太平洋","时间都去哪儿了","肆无忌惮",
        "她很漂亮","体面(Cover 于文文)","听说爱情回来过","我们不一样","无情的雨无情的你","无问西东",
        "小芳","笑红尘","哑巴","演员","一起红火火","勇气","遇见你","阅读爱情","栀子花开",
        "纸短情长(咚鼓版)","最近比较烦","New Silk Road"
    ];
    var list = [];
    var listId = 1;
    for (let i=0; i<3; i++) {
        // 轮播图
        var rotation = [];
        // 推荐歌单
        var recommend = [];
        // 独家放送
        var exclusive = [];
        // 精选专栏
        var featured = [];
        for (var y=0; y<19; y++) {
            var offset = 19 * i + y;
            var data = {};
            data.songid = listId;
            data.name = names[listId];
            data.mp3 = KHost + "/" + names[listId] + ".mp3";
            data.icon_big = KHost + "/" + names[listId]+"_big"+".jpg";
            data.icon_small = KHost + "/" + names[listId]+"_small"+".jpg";
            data.icon_lrc = KHost + "/" + names[listId]+".lrc";
            if (y < 3) {
                data.type = 1;
                rotation.push(data);
            } else if (y < 9) {
                data.type = 2;
                recommend.push(data);
            } else if (y < 13) {
                data.type = 3;
                exclusive.push(data);
            } else {
                data.type = 4;
                featured.push(data);
            }
            listId += 1;
        }
        list.push({
            lid: i,
            rotation: rotation,
            recommend: recommend,
            exclusive: exclusive,
            featured: featured
        });
    }

    // name
    var songs = [];
    var songId = 1;
    for (var i=0; i<names.length; i++) {
        var data = {};
        data.songid = songId;
        data.name = names[i];
        data.mp3 = KHost + "/" + names[i] + ".mp3";
        data.icon_big = KHost + "/" + names[i]+"_big"+".jpg";
        data.icon_small = KHost + "/" + names[i]+"_small"+".jpg";
        data.icon_lrc = KHost + "/" + names[i]+".lrc";
        songs.push(data)
    }
    
    return new Promise(async (resolve, reject)=>{
        await insertDate("list", list);
        await insertDate("song", songs);
        await resolve();
    })
}

module.exports = {
    connectDB, 
    createCollection,
    readListData, 
    readSongData, 
    insertSomeData
}