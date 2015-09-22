    Rails.application.config.middleware.use OmniAuth::Builder do  
      provider :twitter, 'aIdsob0eV4mh3QimAa8N8alR2', 'fmAKd3PKeXpq2Yi2KFkPBsHyjFxc9szn9HkG0UQdFfRBFkIydD'
      provider :google_oauth2, '243778449426-89f31n1etnl33k1itvbbb055a9dmvf52.apps.googleusercontent.com', 'NMvNwcw-bzxD5Sg42f-XdJUH'
    end
