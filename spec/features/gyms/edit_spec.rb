require "rails_helper"

RSpec.describe "Gym Update" do 
    describe "Gym Form" do 
        it "has all attributes for the gym" do 
            gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 

            visit "/gyms/#{gym_1.id}/edit"

            expect(page).to have_content('Name')
            expect(page).to have_content('Always open')
            expect(page).to have_content('Num of platforms')
            expect(page).to have_button("Update Gym")
        end

        describe "when i click on update gym" do 
            it "updates the gym info and redirects user to gym index page" do 
            gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
            visit "/gyms/#{gym_1.id}/edit"

            fill_in('Name', with: "Updated Gym")
            check('Always open')
            fill_in('Num of platforms', with: 6)
            click_button("Update Gym")

            expect(current_path).to eq("/gyms/#{gym_1.id}")
            end
        end
    end 
end 