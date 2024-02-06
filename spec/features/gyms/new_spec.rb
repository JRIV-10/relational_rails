require "rails_helper"

RSpec.describe "Gym Creation" do 
    describe "Gym Form" do 
        it "has all attributes for the gym" do 
            visit "/gyms/new"

            expect(page).to have_content('Name')
            
            expect(page).to have_content('Always open')
            expect(page).to have_content('Num of platforms')
            expect(page).to have_button("Create Gym")
        end

        it "can create a new  Gym" do 
            visit "/gyms/new" 

            fill_in('Name', with: "Jess's Gym")
            click_button('Create Gym')

            expect(current_path).to eq("/gyms")
            expect(page).to have_content("Jess's Gym")
        end
    end
end