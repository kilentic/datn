require 'byebug'
RSpec.describe Visitor, type: :model do 
  let(:visitor) { FactoryBot.create(:visitor) }

  describe "#name" do 
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
  end

  describe "#email" do 
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it "should not allow sensitive uniqueness in email" do 
      prev_visitor = visitor 
      next_visitor = FactoryBot.build(:visitor, email: "HuyTunG.9729@gmail.com")
      expect(next_visitor).not_to be_valid
    end
    context "Only accept valid email format" do 
      it { should allow_value("huytung.9729@gmail.com").for(:email) }
      it { should_not allow_value("huytung").for(:email) }
    end
  end

  describe "#password" do 
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe " #provider and uid" do 
    context " #Allow valid providers and reject invalid ones" do 
      it " #should only allow valid providers" do 
        Visitor.providers.each do |provider, _|
          visitor = FactoryBot.build(:visitor, provider: provider)
          visitor.save 
          expect(visitor.provider).to eq(provider)
        end
      end
      it " #should reject invalid providers" do 
        invalid_providers = ["faceBook", "goOgLe", "abc", "twitter"]
        invalid_providers.each do |provider|
          expect { visitor.provider = provider }.to raise_error(ArgumentError)
        end
      end
    end

    context " #should validate uniqueness of provider scoped to uid" do 
      let(:next_visitor) { FactoryBot.build :visitor, email: "123abc@gmail.com" } 
      it "should reject identical tuples of provider and uid" do 
        expect(next_visitor).to be_valid
      end 
    end 
  end
end
