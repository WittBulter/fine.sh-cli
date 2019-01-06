path = require 'path'
collector = require './collector'
compiler = require './compiler'

class Builds
  check: (settings = {}) ->
    if not settings.document_folder
      fine.print.error 'you need to specify "document_folder" in your fine.json.'
      return false
    if not settings.project_name
      fine.print.error 'you need to specify "project_name" in your fine.json.'
      return false
    if not /^[a-zA-Z][a-zA-Z0-9_]{4,20}$/.test settings.project_name
      fine.print.error 'project_name is not allowed.'
      return false
    true

  tourist: (settings) =>
    files = collector.run do process.cwd
    await compiler.run files, settings
  
  leaguer: (settings) =>
    return process.exit 1 if not @check settings
    absolute_folder = path.join (do process.cwd), settings.document_folder
    files = collector.run absolute_folder
    await compiler.run files, settings
  
  
module.exports = new Builds
