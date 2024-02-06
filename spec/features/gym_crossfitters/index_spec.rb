require "rails_helper"

RSpec.describe "Gym Crossfitters Index" do 
    describe "As a visitor" do 
        describe "When I visit '/gyms/:gym_id/crossfitters" do 
            it "see each Crossfitter that is associated with that Gyms with each Child's attributes" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                roman = gym.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)
                
                visit "/gyms/#{gym.id}/crossfitters"

                expect(page).to have_content("Roman")
                expect(page).to have_content(false)
                expect(page).to have_content(20)
            end
        end

        describe "Gym index link" do 
            it "has a link to the Gym index page" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                roman = gym.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)

                visit "/gyms/#{gym.id}/crossfitters"

                expect(page).to have_content("Gyms")
            end

            it "has a link for the Gyms index page" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                roman = gym.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)

                visit "/gyms/#{gym.id}/crossfitters"

                expect(page).to have_link("Gyms", href:"/gyms" )
            end
        end

        describe "Gym Crossfitters Creation" do 
            it "has a link to /gyms/:gym_id/crossfitters/new" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                roman = gym.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)

                visit "/gyms/#{gym.id}/crossfitters"
                
                expect(page).to have_link('Create a Crossfitter for this gym')

                click_on('Create a Crossfitter for this gym')

                expect(current_path).to eq("/gyms/#{gym.id}/crossfitters/new")
            end
        end

        describe "Sort Crossfitters Alphabetically" do 
            it "has a button to sort the crossfitters" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                roman = gym.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)
                joe = gym.crossfitters.create!(name: "Joe", oly_lift: false, age: 21)
                
                visit "/gyms/#{gym.id}/crossfitters"
                
                expect(page).to have_link('Sort Crossfitters Alphabetically')
                expect(roman.name).to appear_before(joe.name)

                click_on "Sort Crossfitters Alphabetically"

                expect(joe.name).to appear_before(roman.name)
            end
        end
    end
end