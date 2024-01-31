require "rails_helper"

RSpec.describe "Gym Index" do 
    describe "As a visitor" do 
        describe "When I Visit '/parents'" do 
            it "I See The Name of Each Parent Record" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25) 

                visit "/gyms"

                expect(page).to have_content("Joe's Gym")
                expect(page).to have_content("Iron Fitness")

                # expect(page).to have_content(true)
                # expect(page).to have_content(false)

                # expect(page).to have_content(10)
                # expect(page).to have_content(25)
            end
        end
    end
end