var express = require('express')
var app = express()
var request = require('superagent')
var superagent=require('superagent-charset')(request)
var cheerio = require('cheerio')
var eventproxy = require('eventproxy')
var iconv = require('iconv-lite')
var async = require('async');

var currentConcurrencyCount = 0
var maxConcurrencyCount = 3

/// 获取列表
var startChapter = async (datas)=>{
  // 获取列表
  var lists = await getChapter(datas);
  return lists;
}
/// 获取每页小说列表
var getChapterList = (data, callback)=>{
  superagent.get(data.article_href)
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
    $('.book_list a').each((idx, element)=>{
      var $element = $(element);
      var chapter = $element.attr('title');
      var href = $element.attr('href');
      items.push({
        ...data,
        'chapter': chapter,
        'chapter_href': href,
      })
    });
    currentConcurrencyCount--;
    callback(null, items);
  });
}
/// 获取文章列表
var getChapter = (datas)=>{
  return new Promise((resolve, reject) => {
    // 并发连接数的计数器
    async.mapLimit(datas, maxConcurrencyCount, (data, callback)=>{
      currentConcurrencyCount++;
      console.log('当前线程数: ' + currentConcurrencyCount + ', 链接: ' +  data.article_href);
      getChapterList(data, callback);
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
module.exports = startChapter