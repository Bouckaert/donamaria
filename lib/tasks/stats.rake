namespace :stats do
  desc 'Patrimonies by gender statistics'
  task patrimonies_by_gender: :environment do
    %w[MASCULINO FEMININO].each do |gender|
      candidatures = Candidate.where(gender: gender).flat_map(&:candidatures)
      total = candidatures.flat_map(&:patrimonies).inject(0) { |sum, p| sum += p.price }
      puts gender + " " + total.to_s
    end
  end

  desc 'Revenues by gender statistics'
  task revenues_by_gender: :environment do
    %w[MASCULINO FEMININO].each do |gender|
      candidatures = Candidate.where(gender: gender).flat_map(&:candidatures)
      total = candidatures.flat_map(&:revenues).inject(0) { |sum, p| sum += p.price }
      puts gender + " " + total.to_s
    end
  end
end
