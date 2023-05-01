require 'nokogiri'

class XmlImporter
  def self.import(filename)
    xml_file = File.read(filename)
    doc = Nokogiri::XML(xml_file)

    doc.xpath('//product').each do |product_node|
      # Extract data from the XML node
      name = product_node.xpath('name').text
      image_url = product_node.xpath('image_url').text
      price = product_node.xpath('price').text
      in_stock = product_node.xpath('in_stock').text == "true"
      description = product_node.xpath('description').text
      category = product_node.xpath('category').text
      brand = product_node.xpath('brand').text
      gtin = product_node.xpath('gtin').text

      # Find an existing record or create a new one
      product = Product.find_or_initialize_by(name: name)

      # Update the record with the extracted data
      product.assign_attributes(
        image_url: image_url,
        price: price,
        in_stock: in_stock,
        description: description,
        category: category,
        brand: brand,
        gtin: gtin
      )

      # Save the record to the database
      product.save!
    end
  end
end
