class HomeController < ApplicationController

  def index
    # Vidarabine
  end

  def parse_and_load
    require "rexml/document"

    file = File.new( "C:\\code\\drugbank.xml" )
    doc = REXML::Document.new file

    # wrap the whole import in a single transaction for performance reasons.
    ActiveRecord::Base.transaction do

      # for every drug in the xml file
      doc.each_element('drugs/drug') do |drug_element|
        drug_id = drug_element.elements['drugbank-id'].text.tr('DB', '').to_i

        # create a new drug record
        Drug.create(
          :drugbank_id => drug_id,
          :name => drug_element.elements['name'].text,
          :description => drug_element.elements['description'].text,
          :indication => drug_element.elements['indication'].text,
          :pharmacology => drug_element.elements['pharmacology'].text)

        # for every drug interaction in the current drug
        drug_element.each_element('drug-interactions/drug-interaction') do |interaction_element|
          interaction_drug_id = interaction_element.elements['drug'].text.to_i

          # There seems to be duplicate entries in some drugs
          existing = DrugInteraction.where(:drugbank_id => drug_id, :interaction_drugbank_id => interaction_drug_id)

          if existing.length == 0
            # create a new drug interaction record
            DrugInteraction.create(
              :drugbank_id => drug_id,
              :interaction_drugbank_id => interaction_drug_id,
              :description => interaction_element.elements['description'].text,
              :severity => rand,
              :likelihood => rand)
          end
        end
      end
    end
  end
end