class CensusUser
  def self.find(census_user)
    user = User.where(id: census_user["uid"])
      .first_or_create(id: census_user["uid"])
    CensusUser.new(census_user, user)
  end

  def initialize(census_user, user)
    @user       = user
    @cohort_id  = census_user["info"]["cohort_id"]
    @first_name = census_user["info"]["first_name"]
    @last_name  = census_user["info"]["last_name"]
  end

  def id
    @user.id
  end

  def cohort
    Cohort.find(@cohort_id)
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end
