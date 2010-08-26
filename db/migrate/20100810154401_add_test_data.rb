class AddTestData < ActiveRecord::Migration
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
      :price => 27.69)
 end
  def self.down
    Product.delete_all
  end
end
