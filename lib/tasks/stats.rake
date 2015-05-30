namespace :stats do

  def stats
    @stats ||= Stats.find_or_create_by(name: '2014 Statistics')
  end

  def gender_by_variable(variable)
    variable.to_s.start_with?('men') ? 'MASCULINO' : 'FEMININO'
  end

  def candidates_by_gender(gender)
    Candidate.where(gender: gender).count
  end

  def elected_by_gender(gender)
    Candidate.joins(:candidatures)
             .where(gender: gender)
             .where('candidatures.result' => 'elected')
             .count
  end

  def patrimonies_by_gender(gender)
    Candidate.joins(candidatures: :patrimonies)
             .where(gender: gender)
             .sum('patrimonies.price').to_f
  end

  def revenues_by_gender(gender)
    Candidate.joins(candidatures: :revenues)
             .where(gender: gender)
             .sum('revenues.price').to_f
  end

  desc 'Candidates gender statistics'
  task candidates_by_gender: :environment do
    [:women_candidates, :men_candidates].each do |var|
      stats.mapping[var] = candidates_by_gender(gender_by_variable(var))
    end

    stats.save
  end

  desc 'Elected candidates gender statistics'
  task elected_by_gender: :environment do
    [:women_elected, :men_elected].each do |var|
      stats.mapping[var] = elected_by_gender(gender_by_variable(var))
    end

    stats.save
  end

  desc 'Patrimonies by gender statistics'
  task patrimonies_by_gender: :environment do
    [:women_patrimonies, :men_patrimonies].each do |var|
      stats.mapping[var] = patrimonies_by_gender(gender_by_variable(var))
    end

    stats.save
  end

  desc 'Revenues by gender statistics'
  task revenues_by_gender: :environment do
    [:women_revenues, :men_revenues].each do |var|
      stats.mapping[var] = revenues_by_gender(gender_by_variable(var))
    end

    stats.save
  end

  desc "Run all stats tasks"
  task all: [:candidates_by_gender, :elected_by_gender, :patrimonies_by_gender,
    :revenues_by_gender]
end
