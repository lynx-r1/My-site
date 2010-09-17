class User < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_non_blank

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    logger.info(@password + ' ' + self.password)
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(name, password)
    user = User.find_by_name(name)
    if user
      expected_password = User.encrypted_password(password, user.salt)
      user = nil if expected_password != user.hashed_password
    end
    user
  end

  def after_destroy
    raise "Can't delete last user" if User.count.zero?
  end

  private

  def password_non_blank
    error.add(:password, "Missing password") if hashed_password.blank?
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "secret" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
