class UserAttribute < ApplicationRecord
  belongs_to :user

  def add_attribute(name, amount)
    case name
    when "health"
      self.health += amount
      if self.health > 100
        self.health = 100
      end
    when "mana"
      self.mana += amount
      if self.mana > 50
        self.mana = 50
      end
    when "gold"
      self.money += amount
    when "experience"
      self.experience += amount

      level_up = (self.experience / 1024).to_i
      self.experience = (self.experience % 1024).to_i

      self.level += level_up
    end
  end
end
