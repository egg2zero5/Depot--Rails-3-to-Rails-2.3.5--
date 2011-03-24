#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  # a products may assciated to many line_items.

  before_destroy :ensure_not_referenced_by_any_line_item

  #...


=begin  
# validation stuff 3.0.5 ...


  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
# 
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, :length => {:minimum => 10}

=end

  validates_presence_of :title, :description, :image_url


  validates_numericality_of :price


  validate :price_must_be_at_least_a_cent


  validates_uniqueness_of :title


  validates_format_of :image_url,
                      :with    => %r{\.(gif|jpg|png)$}i,
                      :message => 'must be a URL for GIF, JPG ' +
                                  'or PNG image.'



  protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
                       price < 0.01
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
