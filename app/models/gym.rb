class Gym < ApplicationRecord 
    has_many :crossfitters

    def self.ordered 
        Gym.order(created_at: :desc)
    end

    def counted
        self.crossfitters.count
    end

    def ordered_alphabetical
        crossfitters.order(:name)
    end
end