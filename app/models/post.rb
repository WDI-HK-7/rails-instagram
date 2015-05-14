class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :picture,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY']}
  end
end
