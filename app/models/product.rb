# config/elastic_search.rb
ElasticSearchSettingsForProduct = YAML.load_file('config/elastic_search_product.yml').with_indifferent_access
 
class Product < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  attr_accessible :category_id, :price, :title, :url, :featured ,:product_photos, :product_photos_attributes, :tags, :tag_list, :author
  acts_as_taggable
  belongs_to :category
  has_many :product_photos, :dependent => :destroy

  accepts_nested_attributes_for :product_photos, :reject_if => lambda {|a| a[:photo].blank?} , :allow_destroy => true
  
  # mapping do
  #   indexes :id,                  :index    => :not_analyzed
  #   indexes :title,               :analyzer => 'snowball', :boost => 100
  #   indexes :url,                 :analyzer => 'snowball'
  #   indexes :author,              :analyzer => 'keyword'
  #   indexes :tag_name,            :analyzer => 'snowball'
  #   indexes :category_name,       :analyzer => 'snowball'
  #   indexes :tag_name,            :analyzer => 'snowball'
  #   indexes :published_on,        :type => 'date', :include_in_all => false
  # end
  settings ElasticSearchSettingsForProduct do
    mapping do
      # [:title, :author, :category_name, :tag_name].each do |attribute|
      #   indexes attribute, type: 'string', analyzer: 'custom_analyzer'
      # end
        indexes :id,                  :index    => :not_analyzed
        indexes :title,               :analyzer => 'my_analyzer', :boost => 100
        indexes :url,                 :analyzer => 'my_analyzer'
        indexes :author,              :analyzer => 'my_analyzer'
        indexes :tag_name,            :analyzer => 'my_analyzer'
        indexes :category_name,       :analyzer => 'my_analyzer'
        indexes :tag_name,            :analyzer => 'my_analyzer'
        indexes :published_on,        :type => 'date', :include_in_all => false
    end
  end

  def toggle_featured
    if self.featured == false
      self.featured = true
    else
      self.featured = false
    end

    self.save
  end

  def deep_link
    return self.url #+ "?atm_source=affiliate"
  end
 
  def to_indexed_json
    to_json(methods: [:category_name, :tag_name])
  end
  
  def category_name
    category.name
  end

  def tag_name
    tag_list
  end

  def to_param 
    "#{id}-#{title}".parameterize
  end

  class <<self
    def tokenize(query)
     query.split(/\s+/)
    end
 
    def query_from_tokens(tokens)
      %w{name email company}.each do |attribute|
        tokens.map { |token| "#{attr}:#{token}"}
      end.join(" OR ")
    end
 
    def fulltext_search(params)
      formatted_query = query_from_tokens(tokenize(params[:query]))
      self.search(params, formatted_query)
    end
  end

  def self.search(params, formatted_query = nil)
    tire.search( load: true, page: params[:page], per_page: 24) do
      query { string (formatted_query ? formatted_query : params[:query]) , default_operator: "AND" } if params[:query].present?
      #filter :range, published_at: {lte: Time.zone.now}
    end
  end
end