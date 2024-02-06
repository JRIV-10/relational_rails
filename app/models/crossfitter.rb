class Crossfitter < ApplicationRecord 
    belongs_to :gym

    def self.crossfitters_true
        @crossfitters = Crossfitter.where(oly_lift: true)
    end
end