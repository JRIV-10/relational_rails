require "rails_helper"

RSpec.describe "Crossfitters Index" do 
    describe "As a visitor" do 
        it "has a form to update a crossfitters info" do 
            gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
            joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
            visit "/crossfitters/#{joey.id}/edit"

            expect(page).to have_content("Name")
            expect(page).to have_content("Oly lift")
            expect(page).to have_content("Age")
        end

        describe "update info" do 
            it "allows crossfitter's info to be changed" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
                visit "/crossfitters/#{joey.id}/edit"
                
                fill_in('Name', with: 'George')
                check('Oly lift')
                fill_in('Age', with: 19)
                click_button("Update Crossfitter")
                
                expect(current_path).to eq("/crossfitters/#{joey.id}")
                expect(page).to have_content("George")
                expect(page).to have_content(true)
                expect(page).to have_content(19)
            end
        end
    end
end