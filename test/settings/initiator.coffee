path = require 'path'
helps = require '../helps'
{ expect } = require 'chai'
coffee = require '../coffee_custom'
initiator_path = path.join __dirname, '../../src/scripts/settings/initiator'

describe 'settings initiator test', ->

#  it 'should return default setting in tourist mode', ->
#    do helps.setting.clear
#    is_default_setting = (settings) ->
#      expect settings
#        .to.be.an 'object'
#        .to.contains.keys 'project_name'
#        .to.contains.keys 'document_folder'
#        .to.be.includes { project_name: null }
#
#    coffee.run initiator_path
#      .writeKey 'ENTER'
#      .expect 'return', is_default_setting
#      .expect 'code', 0
#      .end()
#
#  it 'should return user setting when file is exists', ->
#    do helps.setting.create
#    is_user_setting = (setting) ->
#      expect setting
#        .to.be.an 'object'
#        .to.contains.keys 'project_name'
#        .to.contains.keys 'document_folder'
#      expect setting.project_name
#        .to.not.be.a.null
#
#    coffee.run initiator_path
#      .expect 'return', is_user_setting
#      .expect 'code', 0
#      .end()

  it 'should create a setting with user inputs', ->
    do helps.setting.clear
    user_input =
      project_name: 'namecase'
      document_folder: 'foldercase'

    is_user_created_setting = (setting) ->
      console.log setting
      expect setting
        .to.be.an 'object'
        .to.be.includes { project_name: user_input.project_name }
        .to.be.includes { document_folder: user_input.document_folder }

    coffee.run initiator_path
      .writeKey 'DOWN', 'ENTER'
      .write user_input.project_name
      .debug()
      .writeKey 'ENTER'
      .write user_input.document_folder
      .writeKey 'ENTER'
      .expect 'return', is_user_created_setting
      .expect 'code', 0
      .end(() ->)




