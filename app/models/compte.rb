class Compte < ApplicationRecord
  belongs_to :user

  after_initialize :default_values

  private

    def default_values
      self.credits ||= 0
    end
end
