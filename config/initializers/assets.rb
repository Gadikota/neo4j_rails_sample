Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( 'dashboard/*.js', 'papa_parse.js', 'home.*', "dashboard.*" )
