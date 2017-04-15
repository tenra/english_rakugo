class AddIntroductionRefTo < ActiveRecord::Migration
  def change
    add_reference :events, :introduction, index: true    
  end
end
