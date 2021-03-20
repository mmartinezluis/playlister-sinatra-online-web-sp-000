module Slugifiable
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def find_by_slug(params_slug)
    self.find {|object| object.slug == params_slug}
  end
end

# module Slugifiable
#   module InstanceMethods
#     def slug
#       self.name.downcase.gsub(" ", "-")
#     end
#   end

#   module ClassMethods
#     def find_by_slug
#      seelf.find{|object| object.slug == params[:slug]}
#     end
#   end   
# end
