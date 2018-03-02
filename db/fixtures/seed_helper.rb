# frozen_string_literal: true

class SeedHelper
  include Singleton

  def populate_dummy_solutions(count)
    count.times.each do |n|
      email_address = "test-account#{n}@example.com"
      next if User.where(email: email_address).any?
      create_solution(email_address)
    end
  end

  def populate_df_admins(admins)
    admins.each do |attrs|
      user = User.find_or_initialize_by(attrs.merge!(
            admin: true,
            organisation: 'Futuregov'
      ))
      user.confirmed_at ||= Time.zone.now
      user.password = ENV['DEFAULT_PASSWORD'] if user.new_record?
      user.save!
    end
  end

  def create_solution(email)
    Solution.new(user: new_user(email),
                 website: 'https://giz-solutions.wearefuturegov.com/',
                 title: FFaker::BaconIpsum.sentence,
                 description: FFaker::BaconIpsum.paragraph,
                 business_opportunities: FFaker::BaconIpsum.paragraph,
                 implementation_impact: FFaker::BaconIpsum.paragraph,
                 skills_experience: FFaker::BaconIpsum.paragraph,
                 terms_accepted: true,
                 hero_image: File.new(
                   Rails.root.join('app', 'assets', 'images', 'cats', "#{rand(1...10)}.jpeg")
                 )).save!
  end

  def new_user(email_address)
    User.new(email: email_address,
             first_name: FFaker::Name.first_name,
             last_name: FFaker::Name.last_name,
             confirmed_at: Time.zone.now,
             password: ENV['DEFAULT_PASSWORD'])
  end
end
