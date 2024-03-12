# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user) { create(:user, password: '12345678', password_confirmation: '12345678') }
  let(:another_user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:another_post) { create(:post, user: another_user) }

  describe 'ログイン後' do

    before do
      visit login_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: '12345678'
      click_button 'ログイン'
      sleep 0.5
    end

    context '正常系' do
      it 'Posts一覧' do
        post
        visit root_path
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('Posts一覧')
        expect(page).to have_content('編集')
        expect(page).to have_content('削除')
      end

      it 'Post投稿' do
        visit new_post_path
        expect(page).to have_current_path(new_post_path)
        fill_in 'タイトル', with: 'テストタイトル'
        fill_in '本文', with: 'テスト本文'
        click_button '登録する'
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('テストタイトル')
        expect(page).to have_content('テスト本文')
      end

      it 'Post詳細' do
        visit post_path(post)
        expect(page).to have_current_path(post_path(post))
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.body)
      end

      it 'Post編集' do
        visit edit_post_path(post)
        expect(page).to have_current_path(edit_post_path(post))
        fill_in 'タイトル', with: '編集済みタイトル'
        fill_in '本文', with: '編集済み本文'
        click_button '更新する'
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('編集済みタイトル')
        expect(page).to have_content('編集済み本文')
      end
    end

    context '他のユーザーのPost' do
      it 'Posts一覧に表示されている' do
        another_post
        visit root_path
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('Posts一覧')
        expect(page).to have_content(another_post.title)
        expect(page).to have_content(another_post.body)
      end

      it 'Posts一覧に編集・削除が表示されない' do
        another_post
        visit root_path
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('Posts一覧')
        expect(page).not_to have_content('編集')
        expect(page).not_to have_content('削除')
      end

      it 'Post詳細を閲覧できる' do
        visit post_path(another_post)
        expect(page).to have_current_path(post_path(another_post))
        expect(page).to have_content('Post詳細')
        expect(page).to have_content(another_post.title)
        expect(page).to have_content(another_post.body)
        expect(page).not_to have_content('編集')
        expect(page).not_to have_content('削除')
      end
    end
  end
end
