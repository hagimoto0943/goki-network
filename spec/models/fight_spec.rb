require 'rails_helper'

RSpec.describe Fight, type: :model do
  describe "enum" do
    it { is_expected.to define_enum_for(:status).with_values(done: 0, progress: 1) }
    end
  end
end
