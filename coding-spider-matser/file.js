const request = require('request');
const fs = require('fs');
const async = require('async');

// var fileUrl  = 'http://image.tianjimedia.com/uploadImages/2015/129/56/J63MI042Z4P8.jpg';
// var filename = 'beauty.jpg';
// downloadFile(fileUrl, filename, ()=>{
//     console.log(filename+'下载完毕');
// });


// 创建文件夹
var createFileDir = (name)=>{
    if (!fs.existsSync('./' + name)) {
        fs.mkdirSync('./' + name);
    }
}
// 下载文件
var downloadFile = (uri, filename, callback)=>{
    console.log('下载文件')
    var stream = fs.createWriteStream('./resources/' + filename);
    request(uri).pipe(stream).on('close', callback); 
}
// 下载文件
var downloadFiles = (datas)=>{
    console.log('音乐个数: ' + datas.length);

    var arr = [];
    for (var i=0; i<datas.length; i++) {
        var data = datas[i];
        arr.push({
            'name': data.songinfo.title + '.lrc',
            'url': data.songinfo.lrclink
        })
        arr.push({
            'name': data.songinfo.title + '_big.jpg',
            'url': data.songinfo.pic_big
        })
        arr.push({
            'name': data.songinfo.title + '_small.jpg',
            'url': data.songinfo.pic_small
        })
        arr.push({
            'name': data.songinfo.title + '.' + data.bitrate.file_extension,
            'url': data.bitrate.file_link
        })
    }


    console.log('开始下载');
    async.mapLimit(arr, 2, (data, callback)=>{
        if (!fs.existsSync('./resources/' + data.name)) {
            console.log('下载完成: ' + data.name);
            downloadFile(data.url, data.name, ()=>{
                callback(null, '');
            });
        } else {
            console.log('已存在: ' + data.name);
            callback(null, '');
        }
    },(err, result)=>{
        
    });
}


module.exports = {createFileDir, downloadFiles, downloadFile}