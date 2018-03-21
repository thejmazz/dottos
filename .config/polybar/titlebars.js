'use strict'

const { spawn, exec } = require('child_process')

const split = require('split2')
const through = require('through2')

function addNewline () {
  return through(function (chunk, enc, next) {
    next(null, chunk + '\n')
  })
}

async function main () {
  const windowId =  await new Promise((resolve, reject) => {
    exec('bspc query -N -n', (err, stdout, stderr) => {
      if (err) {
        return reject(err)
      }

      resolve(stdout)
    })
  })

  console.log('Using windowId:', windowId)

  const cp = spawn('xev', [
    '-id', windowId,
    '-event', 'structure'
  ])

  cp.stdout
    .pipe(split())
    .pipe(through(function (chunk, enc, next) {
      this.currentChunk = this.currentChunk || ''

      if (chunk.toString() === '') {
        // console.log(`C:(${this.currentChunk})`)
        this.push(this.currentChunk)
        this.currentChunk = ''
      }

      this.currentChunk += chunk
      next()
    }))
    .pipe(through.obj(function (chunk, enc, next) {
      // replaces (x,y) into "x $x,y $y"
      const xyRegex = new RegExp(/\(([0-9]+),([0-9]+)\)/)
      const [ xy, x, y, ...rest ] = chunk.toString().match(xyRegex)

      const replacedChunk = chunk.toString().replace(xyRegex, `x ${x},y ${y}`)

      next(null, replacedChunk.toString().split(','))
    }))
    // .pipe(through.obj((obj, enc, next) => next(null, obj.map(i => i.trim()))))
    .pipe(through.obj( function (obj, enc, next) {
      next(null, obj.map(i => i.trim()))
    }))
    .pipe(through.obj(function (obj, enc, next) {
      next(null, obj.reduce((sum, item) => {
        const [ key, val ] = item.split(' ')

        return Object.assign({}, sum, { [key]: val })
      }, {}))
    }))
    .pipe(through.obj(function (obj, enc, next) {
      exec('~/.config/titlebars/move-titlebar.sh')
      next(null, obj)
    }))
    .pipe(through.obj(function (obj, enc, next) {
      next(null, JSON.stringify(obj) + '\n')
    } ))
    // .pipe(addNewline())
    .pipe(process.stdout)
}

main()
  .then(console.log)
  .catch(console.error)

