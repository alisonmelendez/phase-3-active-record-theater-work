class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map do |audition|
        audition.actor 
  end 

  def locations 
    self.auditions.map do |audition|
        audition.location
  end 

    def lead
        actor = self.auditions.find { |audition| audition.hired }
        if actor
        actor
        else 'no actor has been hired for this role'
        end
    end

    def understudy
        second_hired = self.auditions.where(hired: true).second
        if second_hired == nil
            "no actor"
        else second_hired
        end
    end

end