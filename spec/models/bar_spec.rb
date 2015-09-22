require 'rails_helper'

RSpec.describe Bar, type: :model do

  it { should have_valid(:title).when('Bar Title') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:address).when('23 jordan st') }
  it { should_not have_valid(:address).when('', nil) }

  it { should have_valid(:city).when('Chicago') }
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('IL') }
  it { should_not have_valid(:state).when('', nil) }

  it { should have_valid(:zip_code).when('85241') }
  it { should_not have_valid(:zip_code).when('', nil) }

  context 'uniqueness' do
    let!(:bar) { FactoryGirl.create(:bar) }
    let!(:dupe_bar) { FactoryGirl.build(:bar) }

    it 'requires a unique title' do
      dupe_bar.title = bar.title
      expect(dupe_bar).to_not be_valid
      expect(dupe_bar.errors[:title]).to_not be_empty
    end
  end
end
