require "rails_helper"

RSpec.describe "Gym Crossfitters Index" do 
    describe "As a visitor" do 
        describe "When I visit '/gyms/:gym_id/crossfitters/new'" do
            it "has a form to create a new crossfitter" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                
                visit "/gyms/#{gym.id}/crossfitters/new"

                expect(page).to have_content('Name')
                expect(page).to have_content('Oly lift')
                expect(page).to have_content('Age')
                expect(page).to have_button('Create Crossfitter')
            end
            it "redirects user to index page after Create Crossfitter is clicked" do 
                gym = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                visit "/gyms/#{gym.id}/crossfitters/new"

                fill_in('Name', with: 'Joseph')
                check('Oly lift')
                fill_in('Age', with: 15)
                click_button "Create Crossfitter" 

                expect(current_path).to eq("/gyms/#{gym.id}/crossfitters")
                expect(page).to have_content('Joseph')
                expect(page).to have_content(true)
                expect(page).to have_content(15)
            end
        end
    end 
end