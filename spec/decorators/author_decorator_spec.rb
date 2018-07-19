require 'rails_helper'

RSpec.describe AuthorDecorator do
  describe 'title' do
    it 'Should upcase the last_name' do
      expect(Author.new(last_name: 'Tic').decorate.title).to include('TIC')
    end
  end
end
