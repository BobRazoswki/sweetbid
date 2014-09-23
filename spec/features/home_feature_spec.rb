require "rails_helper"

describe 'HOME' do
	it 'has pages/home as homepage' do
		visit root_path
		expect(page).to have_content("Nos réalisations")
	end
end

