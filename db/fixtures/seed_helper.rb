# frozen_string_literal: true

class SeedHelper
  include Singleton

  def populate_dummy_solutions(count)
    count.times.each do |n|
      email_address = "test-account#{n}@example.com"
      puts email_address
      if User.where(email: email_address).count == 0
        user = User.new(email: email_address,
          first_name: FFaker::Name.first_name,
          last_name: FFaker::Name.last_name,
          confirmed_at: Time.now,
          password: ENV['DEFAULT_PASSWORD']
          )
        user.solution = Solution.new(
          website: 'https://giz-solutions.wearefuturegov.com/',
          title: FFaker::BaconIpsum.sentence,
          description: FFaker::BaconIpsum.paragraph,
          business_opportunities: FFaker::BaconIpsum.paragraph,
          implementation_impact: FFaker::BaconIpsum.paragraph,
          skills_experience: FFaker::BaconIpsum.paragraph
          )
        user.solution.hero_image = File.new("#{Rails.root}/app/assets/images/cats/#{rand(1...10)}.jpeg")
        puts user.solution.save && user.save
      end
    end
  end
end
