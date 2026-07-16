# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

descricoes = [
  "Estamos em busca de um Desenvolvedor Full Stack para atuar no desenvolvimento e manutenção de aplicações web utilizando Ruby on Rails, JavaScript e banco de dados SQL.",

  "Procuramos um Desenvolvedor Back-end para criar APIs REST, realizar integrações com sistemas externos e otimizar consultas em banco de dados.",

  "Buscamos um Desenvolvedor Front-end com conhecimentos em HTML, CSS, JavaScript e Tailwind CSS para construir interfaces modernas e responsivas.",

  "O profissional será responsável pelo desenvolvimento de novas funcionalidades, correção de bugs, testes e participação em reuniões ágeis utilizando Scrum.",

  "Estamos contratando um Desenvolvedor Web para atuar na criação de aplicações escaláveis, garantindo desempenho, qualidade e segurança.",

  "Buscamos um profissional para desenvolver sistemas utilizando Ruby on Rails, realizando integrações com APIs e banco de dados relacionais.",

  "Você participará da análise de requisitos, implementação de funcionalidades e manutenção de aplicações corporativas.",

  "A vaga é destinada a profissionais apaixonados por tecnologia, desenvolvimento de software e resolução de problemas.",

  "Estamos procurando um Desenvolvedor Back-end para atuar em projetos de alta disponibilidade e integração entre sistemas.",

  "O candidato trabalhará com desenvolvimento de APIs REST, autenticação de usuários e integração com serviços externos.",

  "Buscamos um Desenvolvedor Full Stack para atuar em todas as etapas do desenvolvimento de aplicações web.",

  "Será responsável por implementar novas funcionalidades, realizar testes e corrigir falhas em aplicações existentes.",

  "O profissional atuará em equipe multidisciplinar utilizando metodologias ágeis como Scrum e Kanban.",

  "Estamos em busca de um desenvolvedor comprometido com boas práticas de programação, código limpo e versionamento com Git.",

  "Você trabalhará no desenvolvimento de sistemas voltados para gestão empresarial utilizando tecnologias modernas.",

  "Buscamos profissionais com vontade de aprender, colaborar em equipe e contribuir para a evolução dos nossos produtos.",

  "A vaga envolve desenvolvimento de aplicações web, integração com bancos de dados e manutenção de sistemas existentes.",

  "O candidato participará do ciclo completo de desenvolvimento, desde a análise até a implantação das funcionalidades.",

  "Estamos contratando para atuar na manutenção e evolução de sistemas internos de grande importância para o negócio.",

  "Será responsável por desenvolver soluções escaláveis, seguras e com foco na melhor experiência do usuário.",

  "Buscamos um Desenvolvedor Júnior para atuar em projetos de inovação e transformação digital.",

  "O profissional participará de revisões de código, planejamento de sprints e implementação de melhorias contínuas.",

  "Você atuará na criação de interfaces intuitivas e integração com APIs REST utilizando boas práticas de desenvolvimento.",

  "Estamos procurando profissionais que desejam crescer na área de desenvolvimento de software e aprender novas tecnologias.",

  "A vaga contempla desenvolvimento, documentação técnica, testes e suporte às aplicações desenvolvidas.",

  "Buscamos desenvolvedores com conhecimentos em bancos de dados SQL, Git e arquitetura MVC.",

  "O candidato será responsável pela manutenção corretiva e evolutiva de aplicações web corporativas.",

  "Estamos expandindo nossa equipe de tecnologia e buscamos profissionais comprometidos com qualidade e inovação.",

  "Você trabalhará em projetos desafiadores utilizando Ruby on Rails, JavaScript e integração com APIs.",

  "A posição exige organização, proatividade e capacidade de trabalhar em equipe para entregar soluções de qualidade.",

  "Buscamos profissionais interessados em desenvolvimento web moderno e boas práticas de engenharia de software.",

  "Será responsável pelo desenvolvimento de funcionalidades, otimização de desempenho e correção de erros.",

  "Estamos contratando desenvolvedores para atuar em aplicações voltadas ao mercado financeiro e empresarial.",

  "Você fará parte de uma equipe responsável por desenvolver produtos digitais inovadores.",

  "O profissional colaborará com analistas, designers e demais desenvolvedores para entregar soluções eficientes.",

  "A vaga oferece oportunidade de crescimento profissional em um ambiente colaborativo e dinâmico.",

  "Buscamos profissionais com conhecimentos em APIs REST, bancos de dados relacionais e controle de versão com Git.",

  "Será responsável pela implementação de melhorias, novas funcionalidades e suporte técnico às aplicações.",

  "Estamos procurando um Desenvolvedor Web para atuar na criação de sistemas seguros, escaláveis e de fácil manutenção.",

  "Você participará da arquitetura, implementação e evolução contínua de aplicações web modernas.",

  "A vaga é ideal para profissionais que gostam de resolver problemas e desenvolver soluções eficientes.",

  "Buscamos desenvolvedores com interesse em aprender novas tecnologias e contribuir com projetos inovadores.",

  "O profissional será responsável por garantir a qualidade do código através de testes e revisões periódicas.",

  "Estamos em busca de talentos para atuar no desenvolvimento de plataformas digitais focadas em performance.",

  "Você trabalhará com integração entre sistemas, desenvolvimento de APIs e modelagem de banco de dados.",

  "A posição envolve desenvolvimento, manutenção e evolução de aplicações utilizadas por milhares de usuários.",

  "Buscamos profissionais que valorizam trabalho em equipe, aprendizado contínuo e compartilhamento de conhecimento.",

  "Será responsável pelo desenvolvimento de soluções utilizando arquitetura MVC e boas práticas de programação.",

  "Estamos contratando um Desenvolvedor Full Stack para atuar em projetos de transformação digital e inovação tecnológica.",

  "O candidato participará da construção de aplicações web modernas, responsivas e integradas com diversos serviços.",

  "Procuramos profissionais comprometidos com qualidade, inovação e entrega de soluções tecnológicas que agreguem valor ao negócio."
]

## criando valores para a tabela companies

20.times do
  Company.find_or_create_by!(name: Faker::Company.name) do |company|
    company.cnpj = Faker::Number.number(digits: 14)
    company.email = Faker::Internet.email
    company.description = descricoes.sample
    company.location = Faker::Address.full_address
    company.website = Faker::Internet.url
    company.active = Faker::Boolean.boolean
  end
end



## criando valores para a tabela jobs

20.times do
  Job.find_or_create_by!(title: Faker::Job.title) do |job|
    job.description = descricoes.sample
    job.salary = Faker::Number.decimal(l_digits: 5, r_digits: 2)
    job.location = Faker::Address.full_address
    job.contract_type = ["CLT", "PJ", "Freelancer"].sample
    job.company_id = Company.pluck(:id).sample
  end
end




10.times do
  Candidate.find_or_create_by!(name: Faker::Name.first_name) do |candidate|
    candidate.lastName = Faker::Name.last_name
    candidate.cpf = Faker::Number.number(digits: 11)
    candidate.email = Faker::Internet.email
    candidate.user_id = 2
  end
end