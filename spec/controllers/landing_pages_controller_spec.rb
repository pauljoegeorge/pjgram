require 'rails_helper'
require 'spec_helper'

feature 'landing page' do
  scenario 'root path' do
    visit '/'
    expect(current_path).to eq '/'
  end
end
