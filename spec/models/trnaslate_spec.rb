# == Schema Information
#
# Table name: trnaslates
#
#  id             :integer          not null, primary key
#  english_letter :string
#  arabic_letter  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

RSpec.describe Trnaslate, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
