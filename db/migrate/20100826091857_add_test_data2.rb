class AddTestData2 < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Agile Web Development with Rails',
      :description =>
      %{<p>
        With this book, you’ll learn how to use ActiveRecord to connect business 
        objects and database tables. No more painful object-relational mapping. 
        Just create your business objects and let Rails do the rest. Need to 
        create and modify your schema? Migrations make it painless (and they’re 
        versioned, so you can roll changes backward and forward). You’ll learn 
        how to use the Action Pack framework to route incoming requests and render 
        pages using easy-to-write templates and components. See how to exploit 
        the Rails service frameworks to send emails, implement web services, 
        and create dynamic, user-centric web-pages using built-in Javascript 
        and Ajax support. There are extensive chapters on testing, deployment, 
        and scaling.
      </p>},
      :image_url => '/images/agile_development_ror.jpg',
      :price => 27.69,
      :locale => 'en')
    Product.create(:title => 'Pragmatic Version Control',
      :description =>
      %{<p>
        This book is a recipe-based approach to using Subversion that will
        get you up and running quickly and correctly. All projects need
        version control: it's a foundational piece of any project' s
        infrastructure. Yet half of all project teams in the U.S. don't use
        any version control at all. Many others don't use it well, and end
        up experiencing time-consuming problems.
      </p>},
      :image_url => '/images/svn.jpg' ,
      :price => 28.50,
      :locale => 'en')
  Product.create(:title => 'Сокровища Валькирии. Стоящий у солнца',
      :description =>
      %{<p>
        Странное оживление царит на Северном Урале. "Тарелочники" неопознанные 
        летающие объекты опознают, "снеговики" снежного человека ловят, шведы 
        ищут варяжское золото, а беглые зэки свою казацкую вольницу организовали. 
        Среди следопытов оказался и бывший сотрудник сверхсекретного Института 
        кладоискателей при Министерстве финансов СССР, профессор Русинов, 
        работавший три года назад над проектом "Валькирия". Институт расформирован, 
        проект заморожен, но у Русинова своя цель: он уверен, что именно там, 
        на Урале, можно найти следы древней Северной цивилизации... 
      </p>},
      :image_url => '/images/sokrov_valkirii-stoya_u_solnca.jpg',
      :price => 224.00,
      :locale => 'ru')
    Product.create(:title => 'Хижина',
      :description =>
      %{<p>
        Семейный турпоход закончился трагедией: у Мака пропала младшая дочь. 
        Вскоре в орегонской глуши, в заброшенной хижине, было найдено 
        свидетельство ее вероятной гибели от рук маньяка. Четыре года спустя так и 
        не смирившийся с утратой отец получает подозрительное письмо, якобы от 
        самого Господа Бога, с советом посетить ту самую лачугу. После долгих 
        колебаний Мак решается на путешествие, которое вдребезги разобьет его 
        представления о природе вещей...
      </p>},
      :image_url => '/images/highina.jpg',
      :price => 211.00,
      :locale => 'ru')
  end

  def self.down
    Product.delete_all
  end
end
