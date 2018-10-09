/*
 * @Author: ecitlm
 * @Date:   2017-12-03 20:31:17
 * @Last Modified by: ecitlm
 * @Last Modified time: 2018-04-14 23:36:41
 */
const axios = require('axios')
const qs = require('qs')
axios.defaults.timeout = 30000

// POST传参序列化
axios.interceptors.request.use(
  config => {
    if (config.method === 'post') {
      config.data = qs.stringify(config.data)
    }
    return config
  },
  error => {
    alert('错误的传参')
    return Promise.reject(error)
  }
)

function get (url, params) {
  return new Promise((resolve, reject) => {
    axios
      .get(url, params)
      .then(
        response => {
          resolve(response.data)
        },
        err => {
          reject(err)
        }
      )
      .catch(error => {
        reject(error)
      })
  })
}

function post (url, params) {
  return new Promise((resolve, reject) => {
    axios
      .post(url, params)
      .then(
        response => {
          resolve(response.data)
        },
        err => {
          reject(err)
        }
      )
      .catch(error => {
        reject(error)
      })
  })
}

module.exports = {
  get,
  post
}
