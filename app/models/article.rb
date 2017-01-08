class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :title, presence: true, length: { minimum: 5 }

  def all_tags= names
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def self.tagged_with name
    Tag.find_by_name!(name).articles
  end

  def self.search search
    where "title ILIKE ? OR summary ILIKE ? OR subtitle ILIKE ? OR text ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
  end
end
