class Trip < ActiveRecord::Base
  belongs_to :match, inverse_of: :trip

  validates :official_number, presence: true
  validates :match, presence: true

  scope :for_user, -> (user_id) do
    quoted = Arel::Nodes.build_quoted(user_id)
    any = Arel::Nodes::NamedFunction.new('ANY', [arel_table[:participants]])
    where(Arel::Nodes::Equality.new(quoted, any))
  end
end
