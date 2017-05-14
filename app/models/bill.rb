class Bill < ApplicationRecord
  belongs_to :publication

  before_save :reference_generator
  before_save :add_price

  require "i18n"
  require 'securerandom'

  def reference_generator
    self.reference = ""

    ref   = self.publication.customer
    ref_1 = I18n.transliterate(ref)
    ref_2 = ref_1.gsub(/\W/, '')
    ref_3 = ref_2.first(4).upcase
    unique_id = SecureRandom.random_number(9999)

    self.reference = "#" + ref_3 + unique_id.to_s
  end

  def add_price
    self.amount = 1234.56
  end

end
