class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
  end

  def profil
    @user = current_user

  end

  def invest_step1
    @investment_profile = InvestmentProfile.new
  end

  def invest_step2
    @investment_profile = current_user.investment_profile
    @civilite = ["Monsieur", "Madame"]
    @categorie = ["Agriculteur", "Artisan", "Chef d'entreprise", "Cadre", "Professeur", "Profession libérale", "Profession scientfique ou artistique", "Profession intermédiare", "Employé", "Ouvrier", "Retraité", "Sans activité professionnelle"]
    @expertise = ["Architecture", "Autre", "BTP et second oeuvre", "Commerciale", "Comptabilité & finance", "Edition/Ecriture", "Formation/Education", "Gestion de projet", "Hotellerie", "Informatique", "Ingénierie", "Maintenance & réparation", "Immobilier", "Juridique", "Logistique", "Marketing", "Production", "Qualité", "Recherche", "Ressources humaines", "Santé", "Sécurité", "Services administratifs", "Service clientèle", "Stratégie & management"]
    @invest4 = ["Réduction fiscale", "Recherche d'un profit important à long terme", "Diversification du portefeuille"]
    @patrimoine2 = ["Inférieur à 200 000€", "Supérieur à 200 000€", "Inférieur à 500 000€", "Supérieur à 500 000€"]
    @blanchiement1 = ["Salaires", "Revenus fonciers", "Pensions, retraites"]
  end

  def invest_step3
    @investment_profile = current_user.investment_profile
  end

  def invest_step4
    @investment_profile = current_user.investment_profile
  end

  def finalize

    current_user.certificat = true
    current_user.save
  end

  def attribution
    @number = current_user.investment_profile.essai.to_i
    @viager_id = Viager.find(current_user.investment_profile.product)
    @number.times do
      @rente_share = RenteShare.where(viager_id: @viager_id, assign: false).first
      @rente_share.user_id = current_user.id
      @rente_share.assign = true
      @rente_share.save
      @bouquet_share = BouquetShare.where(viager_id: @viager_id, assign: false).first
      @bouquet_share.user_id = current_user.id
      @bouquet_share.assign = true
      @bouquet_share.save
    end

  end

  def admin
    @viager = Viager.new
  end

  def old
    @viager = Viager.find(params[:id])
    @old = Old.new
  end

  def epargne
    @user = current_user
  end



end
