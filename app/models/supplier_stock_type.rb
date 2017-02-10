class SupplierStockType
    AMPLE_STOCK = {:id => 1, :name => I18n.t('people', :num => 1)}
    SMALL_STOCK  = {:id => 2, :name => I18n.t('people', :num => 2)}
    NOT_IN_STOCK3 = {:id => 3, :name => I18n.t('people', :num => 3)}
    NOT_IN_STOCK4 = {:id => 4, :name => I18n.t('people', :num => 4)}
    NOT_IN_STOCK5 = {:id => 5, :name => I18n.t('people', :num => 5)}

  def self.all
    self.constants.map { |value| const_get(value) }
  end

end