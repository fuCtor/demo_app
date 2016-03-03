# == Schema Information
#
# Table name: commits
#
#  id          :integer          not null, primary key
#  commited_at :datetime
#  user_id     :integer          indexed
#  sha         :string
#  message     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_commits_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_409a66d7e3  (user_id => users.id)
#

require 'spec_helper'

RSpec.describe Commit, type: :model do
  subject { build :commit }

  it 'should have user' do
    expect(subject).to be_respond_to :user
    expect(subject).to be_respond_to :user_id
  end

  it 'should filter by user email' do
    subject.save
    expect(Commit.for_user(subject.user.email)).to be_present
    expect(Commit.for_user('test')).to_not be_present
  end
end
