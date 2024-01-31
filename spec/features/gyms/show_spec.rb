require "rails_helper" 

RSpec.describe "Gym #Show" do 
    describe "When I visit '/parents/:id' " do 
        it "see's the parent with that id including the parent's attributes" do 
            gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
            gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25) 

            visit "/gyms/#{gym_1.id}"
            # save_and_open_page
            expect(page).to have_content(gym_1[:id])
            expect(page).to have_content("Joe's Gym")
            expect(page).to have_content(true)
            expect(page).to have_content(10)
            
            visit "/gyms/#{gym_2.id}"
            expect(page).to have_content(gym_2[:id])
            expect(page).to have_content("Iron Fitness")
            expect(page).to have_content(false)
            expect(page).to have_content(25)
        end
    end
end