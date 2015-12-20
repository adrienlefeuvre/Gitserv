levelup = require 'levelup'
levelws = require 'level-ws'

module.exports = (path) ->
  return levelws levelup path