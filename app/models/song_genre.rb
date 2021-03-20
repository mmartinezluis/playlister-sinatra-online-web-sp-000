class SongGenre < ActiveRecord::Base
  #include Slugifiable::InstanceMethods
  include Slugifiable
  
  belongs_to :song
  belongs_to :genre
end