class TodoList < ActiveRecord::Base
  has_many :items, :dependent => :destroy
end
