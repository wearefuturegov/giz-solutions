# frozen_string_literal: true

class SeedHelper
  include Singleton

  def populate_dummy_solutions(count)
    count.times.each do |n|
      email_address = "test-account#{n}@example.com"
      next if User.where(email: email_address).any?
      create_user(email_address)
    end
  end

  def create_user(email_address)
    User.new(email: email_address,
                    first_name: FFaker::Name.first_name,
                    last_name: FFaker::Name.last_name,
                    confirmed_at: Time.zone.now,
                    password: ENV['DEFAULT_PASSWORD'],
                    solution: new_solution).save!
  end

  def new_solution
    Solution.new(website: 'https://giz-solutions.wearefuturegov.com/',
                 title: FFaker::BaconIpsum.sentence,
                 description: FFaker::BaconIpsum.paragraph,
                 business_opportunities: FFaker::BaconIpsum.paragraph,
                 implementation_impact: FFaker::BaconIpsum.paragraph,
                 skills_experience: FFaker::BaconIpsum.paragraph,
                 hero_image: File.new(
                   Rails.root.join('app', 'assets', 'images', 'cats', "#{rand(1...10)}.jpeg")
                 ))
  end
end
