class Drug < ActiveRecord::Base
  has_many :drug_interactions, :primary_key => 'drugbank_id', :foreign_key => 'drugbank_id'

  def self.search_names(first_letters)
    where("name like ? or name like ?", "#{first_letters}%", "% #{first_letters}%").order(:name).select([:drugbank_id, :name])
  end

  def self.get_by_id(id)
    where(:drugbank_id => id)
  end
end
