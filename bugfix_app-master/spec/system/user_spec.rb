# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :system do
  context '正常系' do
    it '新規ユーザー登録に成功' do
      visit new_user_path
      fill_in '名前', with: 'テスト'
      fill_in 'メールアドレス', with: 'test@example.com'
      fill_in 'パスワード', with: '12345678'
      fill_in 'パスワード(確認)', with: '12345678'
      click_button '作成'
      expect(page).to have_current_path(login_path)
    end
  end

  context '異常系' do
    it '新規ユーザー登録に失敗' do
      visit new_user_path
      fill_in 'メールアドレス', with: 'test@example.com'
      fill_in 'パスワード', with: '12345678'
      fill_in 'パスワード(確認)', with: '12345678'
      click_button '作成'
      expect(page).not_to have_current_path(login_path)
    end
  end
end
