class Auth
    def initialize(private_key, public_key)
        @private_key = private_key
        @public_key = public_key
    end

    def get_hash(timestamp)
        @hash = Digest::MD5.hexdigest(timestamp + @private_key + @public_key)
    end
    
end