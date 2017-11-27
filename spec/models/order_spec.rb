# spec/models/order_spec.rb
require 'rails_helper'

RSpec.describe Order, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:order) { build(:order) }
    it 'バリデーションに通過する' do
      expect(order).to be_valid(:order_complete)
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'cust_nameがnilの場合' do
      let(:order) { build(:order, cust_name: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_nameが長すぎる場合' do
      let(:order) { build(:order, cust_name: "a" * 1000 ) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_emailがnilの場合' do
      let(:order) { build(:order, cust_email: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_emailが長すぎる場合' do
      let(:order) { build(:order, cust_email: "a" * 1000 ) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_telがnilの場合' do
      let(:order) { build(:order, cust_tel: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_telのformatが異なる場合' do
      let(:order) { build(:order, cust_tel: "08011112222" ) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_postal_codeがnilの場合' do
      let(:order) { build(:order, cust_postal_code: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_postal_codeのformatが場合' do
      let(:order) { build(:order, cust_postal_code: "111-2222" ) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_prefectureがnilの場合' do
      let(:order) { build(:order, cust_prefecture: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_cityがnilの場合' do
      let(:order) { build(:order, cust_city: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_cityが長すぎる場合' do
      let(:order) { build(:order, cust_city: "a" * 1000 ) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_streetがnilの場合' do
      let(:order) { build(:order, cust_street: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
    context 'cust_streetが長すぎる場合' do
      let(:order) { build(:order, cust_street: "a" * 1000 ) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid(:order_complete)
      end
    end
  end
end

