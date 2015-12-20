{exec} = require 'child_process'
should = require 'should'

describe "metrics", () ->

  metrics = null
  before (next) ->
    exec "rm -rf #{__dirname}/../db/metrics && mkdir #{__dirname}/../db/metrics", (err, stdout) ->
      metrics = require '../lib/metrics'
      next err

  it "get a metric", (next) ->
    metrics.save '1', [
      timestamp:(new Date '2015-11-04 14:00 UTC').getTime(), value:23
     ,
      timestamp:(new Date '2015-11-04 14:10 UTC').getTime(), value:56
    ], (err) ->
      return next err if err
      metrics.get '1', (err, metrics) ->
        return next err if err
        # do some tests here on the returned metrics
        next()