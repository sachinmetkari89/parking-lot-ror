module NumberGenerator
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, uniqueness: true
  end

  def generate_number
    last_sequence_number = self.class.order(number: :desc).try(:first) || 0
    self.number = last_sequence_number + 1
  end
end
