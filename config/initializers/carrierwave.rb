
CarrierWave.configure do |config|

  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add AWS_ACCESS_KEY=AKIAJGPGRCTDH6YD35KA AWS_SECRET=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 AWS_REGION=us-west-2

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key => ENV['AWS_SECRET'],
    :region                => 'us-west-2',
    # :host                  => 'amazonaws.com'
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
  config.fog_directory  = 'topthat'
  config.asset_host     = 'https://s3-us-west-2.amazonaws.com/topthat'
  config.fog_public     = true
end
