require "rails_helper"

RSpec.describe "Crossfitters Show" do 
    describe "As a visitor" do 
        describe "When I visit '/crossfitters/:id'" do 
            it "I see the child with that id including the child's attributes" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)

                visit "/crossfitters/#{joey.id}"

                # expect(page).to have_content(joey[:id])
                expect(page).to have_content("Joey")
                expect(page).to have_content(true)
                expect(page).to have_content(25)
            end
        end

        describe "link to crossfitters index" do 
            it "has a link to the crossfitters index page" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)

                visit "/crossfitters/#{joey.id}"
                
                expect(page).to have_content("Crossfitters")
            end

            it "the link takes you to crossfitters index page" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)

                visit "/crossfitters/#{joey.id}"
                click_link('Crossfitters')
            
                expect(current_path).to eq("/crossfitters")
            end
        end

        describe "Update Crossfitter" do 
            it "has a link to update crossfitter info" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
                visit "/crossfitters/#{joey.id}"

                click_link("Update Crossfitter")

                expect(current_path).to eq("/crossfitters/#{joey.id}/edit")
            end
        end
    end 
end 