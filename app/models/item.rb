class Item < ActiveRecord::Base
  belongs_to :todo_list

  def completed?
    complete?
  end

end
