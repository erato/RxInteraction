class DrugsController < ApplicationController
  respond_to :json

  def search_drugs
    term = params[:term]

    if term and term.length >= 2
      matches = Drug.search_names(term.strip)
    elsif
      matches = []
    end

    respond_with(matches)
  end

  def search_interactions
    drug_ids = params[:drugs].split(',').map { |drug_id| drug_id.to_i }.compact

    interactions = DrugInteraction.find_interactions(drug_ids)
    interactions = remove_converse(interactions)

    respond_with(interactions)
  end

  def get_drug
    drug_id = params[:id]
    drug = Drug.get_by_id(drug_id).first

    respond_with(drug)
  end


  private

  def remove_converse(interactions)
    interactions.each do |interaction|
      interactions.each_with_index do |compare_interaction, index|
        interactions[index] = nil if compare_interaction and interaction and
                                     interaction.drugbank_id == compare_interaction.interaction_drugbank_id and
                                     interaction.interaction_drugbank_id == compare_interaction.drugbank_id
      end
    end
    interactions.compact
  end
end
