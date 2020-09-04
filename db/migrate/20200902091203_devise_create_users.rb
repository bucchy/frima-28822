# frozen_string_literal: true
class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      ## Database authenticatable
<<<<<<< Updated upstream
      
      t.string :nickname,           null: false
      t.string :email,              null: false, default: ""
      t.string :password,           null: false, default: ""
=======
      t.string :nickname,           null: false
      t.string :email,              null: false, default: ""
      t.string :password,           null: false, default: ""
      t.string :identification,     null: false
      t.string :histroy,            null: false
>>>>>>> Stashed changes

      t.string :identification,     null: false
      t.string :histroy,            null: false
      add_index :users, :email,                unique: true
      add_index :users, :reset_password_token, unique: true

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
<<<<<<< Updated upstream
  
    
  
    create_table :items do |t|
     
=======

  
    
  

    create_table :items do |t|
>>>>>>> Stashed changes
      ## Database authenticatable
     
      t.string  :name,               null: false
      t.text    :image,              null: false
      t.integer :price,              null: false
      t.string  :category,           null: false
      t.string  :status,             null: false
    
    end
    
    create_table :purchases do |t|
    
      ## Database authenticatable
<<<<<<< Updated upstream
    
=======
>>>>>>> Stashed changes
      t.string   :fee,                null: false
      t.string   :credit_card,        null: false
    
    end
    
    create_table :adress do |t|
    
      ## Database authenticatable
    
      t.string  :address,            null: false
      t.integer :phone_number,       null: false
      t.integer :shipping_time,      null: false
      t.string  :map,                null: false
    
    end
    
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end