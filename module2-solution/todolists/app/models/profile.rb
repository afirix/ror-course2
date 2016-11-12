class Profile < ActiveRecord::Base
  belongs_to :user

  validate :name_not_blank
  validate :male_name_not_sue
  validates :gender, inclusion: { in: ["male", "female"] }

  def name_not_blank
  	if first_name.to_s.empty? && last_name.to_s.empty?
  	  errors[:base] << "First and last names cannot be both empty at the same time"
  	end
  end

  def male_name_not_sue
  	if gender == "male" && first_name == "Sue"
  	  errors[:base] << "Male cannot have name Sue"
  	end
  end

  def self.get_all_profiles(min_year, max_year)
  	Profile.where("birth_year BETWEEN :min AND :max", min: min_year, max: max_year).order(:birth_year)
  end
end
