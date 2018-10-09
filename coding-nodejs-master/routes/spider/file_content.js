

var fs = require('fs');
var async = require('async');
var fileHost = './public/file/'
var errorHost = './public/error/'

/// 写入文章
var writeCapter = async (data)=>{
  await writeFilePath(fileHost);
  // 创建类型路径
  let articlePath = fileHost + '/' + data.name;
  await writeFilePath(articlePath);
  // 创建章节路径
  let chapterPath = articlePath + '/' + data.chapter + '.txt';
  await writeFile(chapterPath, data);
}
/// 记录错误
var writeError = async (data)=>{
  await writeFilePath(errorHost);
  // 创建章节路径
  let chapterPath = errorHost + '/' + data.name + '.txt';
  await writeFile(chapterPath, data);
}
/// 创建文件路径
var writeFilePath = async (file)=>{
  return new Promise((resolve, reject) => {
    fs.exists(file, (exists)=>{  
      // 文件夹存在
      if (exists) {
        resolve();
      }
      // 文件夹不存在
      else { 
        // 创建文件夹
        fs.mkdir(file, (err)=>{
          if(err) {
            console.error(err);  
            resolve();
          }
          resolve();
        });
      }   
    })
  })


   

  


  
  

  // fs.writeFile('./public/file/123/inpu1t.txt', '我是通 过fs.writeFile 写入文件的内容',  function(err) {
  //   if (err) {
  //       return console.error(err);
  //   }
  //   console.log("数据写入成功！");
  //   console.log("--------我是分割线-------------")
  //   console.log("读取写入的数据！");
  // });
}
/// 创建数据
var writeFile = async (path, file)=>{
  return new Promise((resolve, reject) => {
    // fs.writeFile(path, file.content, (err)=>{
    //   if (err) {
    //     reject(err);
    //     return;
    //   }
    //   resolve();
    // });
    fs.open(path, "a+", (err, fd) => {
      if (err) {
        reject(err);
        return;
      }
      fs.writeFile(fd, file.content + '\n', {flag: 'a+'}, (err)=>{
        if (err){
          reject(err);
        } else {
          resolve();
        }
      });
    });
  })
}




module.exports = {writeCapter, writeError};