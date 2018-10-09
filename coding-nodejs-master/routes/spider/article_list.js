var express = require('express')
var app = express()
var request = require('superagent')
var superagent=require('superagent-charset')(request)
var cheerio = require('cheerio')
var eventproxy = require('eventproxy')
var iconv = require('iconv-lite')
var async = require('async');

var kHost = 'http://wodeshucheng.com/1_'
var currentConcurrencyCount = 0
var maxConcurrencyCount = 3

/// 获取列表
var startList = async ()=>{
  // 获取列表链接
  var urls = await getUrls();
  // 获取列表
  var lists = await getDetail(urls);
  return lists;
}
/// 获取列表
var getUrls = ()=>{
  var urls = [];
  for (let i=1; i<=1; i++) {
    urls.push(kHost+i+'/');
  }
  return urls;
}
/// 获取每页小说列表
var getDetailList = (url, callback)=>{
  superagent.get(url)
    .charset('gbk')
    .end((err, sres)=>{
    // 错误处理
    if (err) {
      console.log('有错误');
      console.log(err);
      callback(null, null);
      return;
    }
    // 解析
    var $ = cheerio.load(sres.text);
    var items = [];
    $('.box .books .bk').each((idx, element)=>{
      var $element = $(element);
      var name = $element.children().eq(0).children().eq(0).attr('title');
      var href = $element.children().eq(0).children().eq(0).attr('href');
      var icon = $element.children().eq(0).children().eq(0).children().eq(0).attr('src');
      var author = $element.children().eq(2).text();
      var lastChapter = $element.children().eq(3).text();
      var lastUpdate = $element.children().eq(4).children().eq(0).text();
      var desc = $element.children().eq(5).text();
      items.push({
        'name': name,
        'article_href': href,
        'icon': icon,
        'author': author,
        'lastChapter': lastChapter,
        'lastUpdate': lastUpdate,
        'desc': desc,
      })
    });
    currentConcurrencyCount--;
    callback(null, items);
  });
}
/// 获取文章列表
var getDetail = (urls)=>{
  return new Promise((resolve, reject) => {
    // 并发连接数的计数器
    async.mapLimit(urls, maxConcurrencyCount, (url, callback)=>{
      currentConcurrencyCount++;
      console.log('当前线程数: ' + currentConcurrencyCount + ', 链接: ' +  url);
      getDetailList(url, callback);
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
module.exports = startList