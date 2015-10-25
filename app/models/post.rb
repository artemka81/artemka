class Post < ActiveRecord::Base

        extend FriendlyId
          friendly_id :title_or_slug, :use => [:slugged, :history]

        validates :title, :presence => true

        def should_generate_new_friendly_id?
                new_record? || slug == ""
          end

        def title_or_slug
                slug = nil if slug == ""
                slug ? slug : title
        end

         def normalize_friendly_id(string)
		    string.to_s.to_slug.normalize(transliterations: :russian).to_s
		  end

end
