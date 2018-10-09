var express = require('express')
var app = express()
var request = require('superagent')
var superagent=require('superagent-charset')(request)
var cheerio = require('cheerio')
var eventproxy = require('eventproxy')
var iconv = require('iconv-lite')
var async = require('async');

var {writeCapter, writeError} = require('./file_content')

var currentConcurrencyCount = 0
var maxConcurrencyCount = 30

/// 获取列表
var startContent = async (datas)=>{
  var lists = await getContent(datas);
  return lists;
}
/// 写入文件
var writeFile = async (items, callback)=>{
  await writeCapter(items[items.length - 1]);
  callback(null, items);
}
/// 写入错误
var hasError = async (data, callback)=>{
  console.log(data);
  data.content = data.chapter;
  await writeError(data);
  callback(null, null);
}
/// 获取每页小说列表
var getContentList = (data, callback)=>{
  superagent.get(data.chapter_href)
    .charset('gbk')
    .end((err, sres)=>{
    // 错误处理
    if (err) {
      console.log('有错误');
      console.log(err);
      hasError(data, callback);
      // callback(null, null);
      return;
    }
    // 解析
    var $ = cheerio.load(sres.text);
    var items = [];
    $('.nc_l,#jsnc_l').each((idx, element)=>{
      var $element = $(element);
      var name = $element.children().eq(0).children().eq(0).children().eq(0).text();
      var content = $element.text()
      items.push({
        ...data,
        'content': content
      })
    });
    currentConcurrencyCount--;
    writeFile(items, callback);
  });
}
/// 获取文章列表
var getContent = (datas)=>{
  return new Promise((resolve, reject) => {
    // 并发连接数的计数器
    async.mapLimit(datas, maxConcurrencyCount, (data, callback)=>{
      currentConcurrencyCount++;
      console.log('当前线程数: ' + currentConcurrencyCount + ', 链接: ' + data.chapter_href);
      getContentList(data, callback);
    }, (err, result)=>{
      if (err) {
        reject(err);
      }
      var results = [];
      for (let i=0; i<result.length; i++) {
        if (result[i] != null) {
          results.push(...result[i])
        }
      }
      resolve(results);
    });
  })
}
module.exports = startContent