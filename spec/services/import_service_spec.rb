# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

require 'spec_helper'

RSpec.describe ImportService, type: :service do
  context 'valid user and repo' do
    it do
      expect(Commit.count).to eq(0)
      expect(User.count).to eq(0)

      expect { ImportService.run('fuctor', 'qamqp') } .to_not raise_error

      expect(Commit.count).to_not eq(0)
      expect(User.count).to_not   eq(0)
    end
  end

  context 'invalid user and repo' do
    it do
      expect(Commit.count).to eq(0)
      expect(User.count).to eq(0)

      expect { ImportService.run('fuctor', 'test') } .to_not raise_error

      expect(Commit.count).to eq(0)
      expect(User.count).to   eq(0)
    end
  end

end
