require 'rails_helper'
# TEST de integración:
describe 'authors CRUD' do
  context 'with an existing author' do
    before { FactoryBot.create(:author, first_name: 'Leo') }
    it 'should be listed' do
      visit authors_path
      # Nunca se debe comitear un debug:
      # save_and_open_page
      expect(page).to have_content('Leo')
      click_link 'Show'
      expect(page).to have_link 'Back', href: authors_path
      expect(page).to have_css(:h1, text: 'Leo')
    end
  end
end