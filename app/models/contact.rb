class Contact < ApplicationRecord
  # Associations 
  # belongs_to
  # has_many
  # has_one
  # has_many :through
  # has_one :through
  # options - #dependent
  has_many :notes, dependent: :destroy
  # has_one :note
  has_one :address, dependent: :destroy

  # Validations
    # confirmation
    #   two fields in a form have to match
    #     password passwordconfirmation

    inclusion
      validates attr value with the included set 
      class Coffee < ActiveRecord::Base
        validates :size, inclusion: { 
          in: %w(small medium large),
            message: "%{value} is not a valid size" 
        }
      end

    length
      valid a attr by length 
      class Person < ActiveRecord::Base
        validates :name, length: { minimum: 2 }
        validates :bio, length: { maximum: 500 }
        validates :password, length: { in: 6..20 }
        validates :registration_number, length: { is: 6 }
      end

    numericality
      only numeric values
      class Player < ActiveRecord::Base
        validates :points, numericality: true
        validates :games_played, numericality: { only_integer: true }
        validates :golf_handicap, numericality: { 
          less_than_or_equal_to: 40.4, 
          greater_than_or_equal_to: 2 
        }
      end
    presence
      have to a value in order to be in the db

      validates :name, :login, :email, presence: true

    uniqueness

    validates :email, uniqueness: true


    # validation options
      allow_nil 
      class Coffee < ActiveRecord::Base
        validates :size, inclusion: { in: %w(small medium large),
        message: "%{value} is not a valid size" }, allow_nil: true
      end
      allow_blank 
      class Topic < ActiveRecord::Base
        validates :title, length: { is: 5 }, allow_blank: true
      end
      message
      on 

      validates :email, uniqueness: true, on: :create
      validates :age, numericality: true, on: :update
      validates :name, presence: true, on: :save




    # Callbacks 
    trigger logic depending on a certain action
    before_validation
    after_validation
    before_save
    after_save
    before_create
    after_create
    around_create
    around_save


    class CreditCard < ActiveRecord::Base
      after_save :encrypt_card_number
     
      private
     
        def encrypt_card_number
          self.card_number = bcrypt(self.card_number)
        end
    end


    Attr Serialization

    serialize :hobbies, Array



    Model method

      Class method
        whole entire table
        def self.by_first_name
          order(:first_name)
        end

        Contact.by_first_name

      instance method
        on a instance of an object


        def full_name
          "#{self.first_name} #{self.last_name}"
        end

        <%= katy.full_name %>





end
