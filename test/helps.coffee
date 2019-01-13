fs = require 'fs'
path = require 'path'
child = require 'child_process'
template = require '../src/scripts/settings/template'
setting_path = path.join process.cwd(), '.fine/fine.json'
setting_folder_path = path.join process.cwd(), '.fine'

module.exports =
  pick: (type, string_val) ->
    reg = new RegExp "#{type}&&([\\s\\S]*)#{type}&&"
    return null if not reg.test string_val
    str = (string_val.match reg)[1]
    try
      (JSON.parse str).$$$
    catch err
      null

  setting:
    clear: ->
      child.execSync "rm -rf #{setting_folder_path}"

    create: ->
      template.project_name = 'test'
      child.execSync "rm -rf #{setting_folder_path} && mkdir #{setting_folder_path}"
      fs.writeFileSync setting_path, JSON.stringify template, '', '\t'


