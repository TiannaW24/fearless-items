class Item < ApplicationRecord

    # Property validations
    validates_presence_of :name
end
