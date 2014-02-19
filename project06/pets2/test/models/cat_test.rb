require 'test_helper'

class CatTest < ActiveSupport::TestCase
  test "cat attributes must not be empty" do
		cat = Cat.new
		assert cat.invalid?
		assert cat.errors[:name].any?
		assert cat.errors[:breed].any?
		assert cat.errors[:image_url].any?
		assert cat.errors[:description].any?
	end
	
	def new_cat(image_url)
    Cat.new(name:       "Name",
                description: "Cat",
                breed:       "Tomcat",
                image_url:   image_url)
  end
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_cat(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_cat(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "cat is not valid without a unique description" do
    cat = Cat.new(name:       "Cat",
                          description: cats(:test).description, 
                          breed:       "Tomcat", 
                          image_url:   "fred.gif")

    assert cat.invalid?
    assert_equal ["has already been taken"], cat.errors[:description]
  end
end
