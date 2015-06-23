
class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16
  AGE_MAXIMUM = 35
  REJECTED_NAMES = ["Llorenç", "Sharon", "Nick"]

  validate :proper_age, :accepted_name,
            :has_name, :has_surnames,
            :proper_url, :has_dogs

  def complete_name
    "#{name} #{surnames}"
  end

  private

  def has_name
    unless name
      errors.add(:name, 'name is empty')
    end
  end

  def has_surnames
    unless surnames
      errors.add(:surnames, 'surnames are not defined')
    end
  end

  def proper_url
    unless website.match(/\Ahttp:/)
      errors.add(:website, "that's not a proper url")
    end
  end

  def has_dogs
    unless number_of_dogs > 0
      errors.add(:number_of_dogs, 'needs to have at least one dog')
    end
  end

  def proper_age
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
    unless birthday > AGE_MAXIMUM.years.ago
      errors.add(:birthday, 'is too old')
    end
  end

  def accepted_name
    if REJECTED_NAMES.include?(name)
      errors.add(:name, 'is not accepted')
    end
  end
end
