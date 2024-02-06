require "rails_helper"

RSpec.describe "Crossfitters Index" do 
    describe "As a visitor" do 
        describe "When I visit '/crossfitters'" do 
            it "I see each Crossfitter in the system and attributes" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
                roman = gym_1.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)

                visit "/crossfitters"

                expect(page).to have_content("Joey")
                expect(page).to have_content(true)
                expect(page).to have_content(25)

                expect(page).not_to have_content("Roman")
                expect(page).not_to have_content(false)
                expect(page).not_to have_content(20)
            end
        end

        describe "Gym index link" do 
            it "has a link to the Gym index page" do 
                visit "/crossfitters"

                expect(page).to have_content("Gyms")
            end

            it "has a link for the Gyms index page" do 
                visit "/crossfitters"

                expect(page).to have_link("Gyms", href:"/gyms" )
            end
        end

        describe "Update Crossfitter" do 
            it "allows user to update crossfitter" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
                visit "/crossfitters"

                click_on "Update Crossfitter"

                expect(current_path).to eq("/crossfitters/#{joey.id}/edit")
            end
        end
    end
end