require 'jwt'

class Auth
    ALGORITHM = 'HS256'

    def self.issue(payload)     
        JWT.encode(payload,
            auth_secret,
            ALGORITHM)
    end

    def self.decode(token)
        JWT.decode(token, 
            auth_secret, 
            true, 
            { algorithm: ALGORITHM }).first
    end

    private
    def self.auth_secret
        Rails.application.credentials.secret_key_base
    end

end  