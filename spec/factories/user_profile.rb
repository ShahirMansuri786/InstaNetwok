FactoryBot.define do
	factory :user_profile do
		association :user  
		profile_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png'), 'image/png') }
	end
end  