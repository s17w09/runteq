# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserSession', type: :system do
  let(:user) { create(:user) }

  context '正常系' do
    it 'ログインに成功' do
      visit login_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: '12345678'
      click_button 'ログイン'
      expect(page).to have_current_path(root_path)
    end
  end

  context '異常系' do
    it 'ログインに失敗' do
      visit login_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      expect(page).not_to have_current_path(root_path)
    end
  end
end
