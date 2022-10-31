# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Create a sample user with admin privileges
User.create!(name: "Example Admin User",
            email: "usera1@example.com",
            password: "a12345",
            password_confirmation: "a12345",
            admin: true)
# Create sample users without admin privileges
User.create!(name: "Example B User",
            email: "userb1@example.com",
            password: "b12345",
            password_confirmation: "b12345",
            admin: false)
User.create!(name: "Example C User",
            email: "userc1@example.com",
            password: "c12345",
            password_confirmation: "c12345",
            admin: false)

Link.create!(original_url: "https://www.honolulu.gov/cms-dpr-menu/site-dpr-sitearticles/569-ho-omaluhia-botanical-garden.html", short_code: "kLM123")
Link.create!(original_url: "https://www.honolulu.gov/cms-dpr-menu/site-dpr-sitearticles/572-koko-crater-botanical-garden.html", short_code: "23xy99")
Link.create!(original_url: "https://www.honolulu.gov/rep/site/dpr/dpr_docs/hanaumabay_use.pdf", short_code:"9edcba")
Link.create!(original_url: "https://health.hawaii.gov/coronavirusdisease2019/what-you-can-do/how-to-prevent-the-spread-of-covid-19/", short_code:"ziGzaG")
