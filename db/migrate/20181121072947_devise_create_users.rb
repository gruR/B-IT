# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  # 학생 모델 User
  # gem Devise를 사용했다.
  def change
    create_table :users do |t|
      ## Database authenticatable
      # 학과, 학번, 이름, 이메일, 비밀번호
      t.string :student_dept,           null: false, default: ""
      t.string :student_id,           null: false, default: ""
      t.string :name,           null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      #0이면 기본, 1이면 경고 1회 상태 ,2면 아웃.
      t.integer :is_black
  
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
