require 'rails_helper'
# TEST de integración:
describe 'authors CRUD' do
  context 'with an existing author' do
    before { FactoryBot.create(:author, first_name: 'Leo') }
    it 'should be listed' do
      visit authors_path
      expect(page).to have_content('Leo')
    end
  end
end