class ContactNumber < ApplicationRecord
  belongs_to :contact
  validates_uniqueness_of :number, scope: :contact_id, case_sensitive: false
  validates_uniqueness_of :contact_type, scope: :contact_id
end
