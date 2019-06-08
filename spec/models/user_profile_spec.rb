require 'rails_helper'
describe UserProfile do
  describe '#create' do
    it "is invalid without user_profile inputs" do
      user_profile = UserProfile.new(lastname: "", firstname: "", lastname_kana: "", firstname_kana: "",
                                     birth_year: "", birth_month: "", birth_day: "",
                                     postal_code: "", prefecture: "", city: "", block_number: "", building_name: "",
                                     phone_number: 1234567)
      user_profile.valid?
      expect(user_profile.errors[:lastname]).to include("姓を入力してください")
      expect(user_profile.errors[:firstname]).to include("名を入力してください")
      expect(user_profile.errors[:lastname_kana]).to include("セイを入力してください")
      expect(user_profile.errors[:firstname_kana]).to include("カナを入力してください")
      expect(user_profile.errors[:birth_year]).to include("Birth yearを入力してください")
      expect(user_profile.errors[:birth_month]).to include("Birth monthを入力してください")
      expect(user_profile.errors[:birth_day]).to include("Birth dayを入力してください")

      user_profile.valid?(:phone_number_validates)
      expect(user_profile.errors[:phone_number]).to include("電話番号は8文字以上で入力してください")

      user_profile.valid?(:address)
      expect(user_profile.errors[:postal_code]).to include("郵便番号を入力してください")
      expect(user_profile.errors[:prefecture]).to include("都道府県を入力してください")
      expect(user_profile.errors[:city]).to include("Cityを入力してください")
      expect(user_profile.errors[:block_number]).to include("Block numberを入力してください")
      expect(user_profile.errors[:building_name]).to include("Building nameを入力してください")
    end
  end
end