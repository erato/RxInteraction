class DrugInteraction < ActiveRecord::Base
  belongs_to :drug, :foreign_key => 'drugbank_id'

  def self.find_interactions(potential_interaction_drugs)
    # search both sides of the interaction for interactions
    # that are only defined in one direction.  The removal of 
    # the converse will be handled in the application
    where('drugbank_id in (?) and interaction_drugbank_id in (?)',
      potential_interaction_drugs, potential_interaction_drugs)
  end
end
