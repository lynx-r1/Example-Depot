xml.products_list(:for_product => "catalog") do
  for p in @products
    xml.product do
      xml.image_url p.image_url
      xml.title p.title
      xml.description p.description
    end
  end
end