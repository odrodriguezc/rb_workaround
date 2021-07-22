ActionMailer::Base.add_delivery_method :cloudmailin, Mail::SMTP,
     address: 'smtp.cloudmta.net',
     port: 2525,
     domain: 'https://dry-wildwood-57422.herokuapp.com',
     user_name: ENV['CLOUDMAILIN_USERNAME'],
     password: ENV['CLOUDMAILIN_PASSWORD'],
     authentication: 'plain',
     enable_starttls_auto: true