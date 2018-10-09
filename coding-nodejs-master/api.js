
var express = require('express');
var app = express();
var {readSongData, readListData} = require('./mongodb');
var {loadCache, saveCache} = require('./cache');

// 歌曲列表
var songlist = async (req, res)=>{
    // 数据
    var lid = req.query.lid;
    lid = lid == undefined ? 0 : parseInt(lid);
    // 从缓存读取
    var key = 'songlist' + '_' + lid;
    loadCache(key, async (data)=>{
        // 有缓存
        if (data != null) {
            console.log('通过缓存');
            // 加个延时
            setTimeout(() => {
                res.send(JSON.parse(data.data));
            }, 500);
        } 
        // 没有缓存, 从数据库
        else {
            console.log('通过数据库');
            var data = await readListData(lid);
            // 有数据, 加入到缓存
            if (data != undefined && data.length != 0) {
                // 存值
                saveCache(key, {data: JSON.stringify(data)}, ()=>{
                    console.log('加入缓存成功');
                });
            }
            await res.send(data);
        }
    })
}
// 歌曲详情
var songdetail = async (req, res)=>{
    // 数据
    var songid = req.query.songid;
    songid = songid == undefined ? 0 : songid;
    // 读取数据
    var data = await readSongData(songid);
    // 从缓存读取
    var key = 'songdetail' + '_' + songid;
    loadCache(key, async (data)=>{
        // 有缓存
        if (data != null) {
            console.log('通过缓存');
            // res.send(JSON.parse(data.data));
            // 加个延时
            setTimeout(() => {
                res.send(JSON.parse(data.data));
            }, 500);
        }
        // 没有缓存, 从数据库
        else {
            console.log('通过数据库');
            var data = await readSongData(songid);
            // 有数据, 加入到缓存
            if (data != undefined && data.length != 0) {
                saveCache(key, {data: JSON.stringify(data)}, ()=>{
                    console.log('写入缓存成功');
                });
            }
            await res.send(data);
        }
    });
}
// 歌曲分类
var songcategory = async (req, res)=>{
    // 暂空
}

module.exports = {
    songlist,
    songdetail,
    songcategory
}
