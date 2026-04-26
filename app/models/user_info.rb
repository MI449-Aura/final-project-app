class UserInfo < ApplicationRecord
  serialize :recipes, coder: JSON
end
