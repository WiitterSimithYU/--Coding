// "dev": "node --max_old_space_size=2048 app"

var express = require('express')
var app = express()
var fs = require('fs');
var async = require('async');

var startList = require('./article_list')
var startChapter = require('./article_chapter')
var startContent = require('./article_content')
var {writeCapter, writeError} = require('./file_content')

var startSpider = async ()=>{
  // 小说列表页
  var articleUrls = await startList();
  // 小说详情页
  var chapterUrls = await startChapter(articleUrls);
  // 小说内容页
  var content = await startContent(chapterUrls);
} 




module.exports = startSpider