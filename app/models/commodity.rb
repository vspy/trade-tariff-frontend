class Commodity < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :chapter
  belongs_to :heading, class_name: 'Commodity', foreign_key: 'heading_id'

  tire do
    mapping do
      indexes :id,           index: :not_analyzed
      indexes :chapter_id,   index: :not_analyzed # not sure this will be needed yet
      indexes :code,         index: :not_analyzed
      indexes :description,  analyzer: 'snowball'
    end
  end

  def to_s
    description
  end
end
