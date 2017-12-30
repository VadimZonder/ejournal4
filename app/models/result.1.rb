class Result < ActiveRecord::Base
    def result_params
        params.require(:result).permit( :date_time, :student_id, :classes, :grade, :comments)
    end

  belongs_to :student
end
