require "rails_helper"

RSpec.describe "Gym Index Page", type: :feature do 
    describe "As a visitor" do 
        describe "When I Visit '/parents'" do 
            it "I See The Name of Each Parent Record" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25) 

                visit "/gyms"
                
                within "#gym-#{gym_1.id}" do 
                    expect(page).to have_content("Joe's Gym")
                end 
                within "#gym-#{gym_2.id}" do 
                    expect(page).to have_content("Iron Fitness")
                end 
            end

            it "has a link to the that gyms page" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                visit "/gyms"
                click_link "#{gym_1.name}"

                expect(current_path).to eq("/gyms/#{gym_1.id}")
            end
        end

        describe "#self.ordered" do 
            it "orders gyms in the order when they are created" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                sleep(1)
                gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25) 

                visit "/gyms" 

                expect(gym_2.name).to appear_before(gym_1.name)
            end
        end

        describe "link to crossfitters index" do 
            it "has a link to the crossfitters index page" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 

                visit "/gyms"
                
                expect(page).to have_content("Crossfitters")
            end

            it "the link takes you to crossfitters index page" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 

                visit "/gyms"
            
                expect(page).to have_link("Crossfitters", href: "/crossfitters")
            end
        end

        describe "users see the link to create a new Gym record" do 
            it "it has a link called 'New Gym'" do 
                visit "/gyms"
                
                expect(page).to have_link("New Gym", href: "/gyms/new")
            end

            it "takes users to '/gyms/new' when clicked" do 
                visit "/gyms" 
                click_on "New Gym"

                expect(page).to have_current_path("/gyms/new")
            end
        end

        describe "Update Gym" do 
            it "has a link to update the gym" do
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 

                visit "/gyms" 
                click_on "Update Gym"

                expect(page).to have_current_path("/gyms/#{gym_1.id}/edit")
            end
        end
    end
end