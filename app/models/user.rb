class User< OmniAuth::Identity::Models::ActiveRecord
  has_secure_password
  validates_presence_of :name
  validates_uniqueness_of :email
  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) ||create_with_omniauth(auth)
  end

  require 'securerandom'
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.password = SecureRandom.urlsafe_base64
    end
  end
  # require 'securerandom'
  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.name = auth.info.name
  #       user.password = SecureRandom.urlsafe_base64
  #   end
  # end
end
