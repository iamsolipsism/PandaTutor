module Api
  module V1
    
class UsersController < ApplicationController
 
   before_filter :fetch_user, :except => [:index, :create]
  respond_to :json, :xml
  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def index
#    @users = User.where("name = ? or university = ? or grade = ?", params[:name], params[:email], params[:grade])
#sample api call: http://localhost:3000/api/v1/users.json?university=doe&courseName=aa&grade=d
#note all 3 must be present to make the call

    @users = User.where("university = ?", params[:university])
    flagHasTakenWithGrade = false #assume false by default
    courseNameParams = params[:courseName]
    gradeNameParams = params[:grade]

    for index1 in 0 ... @users.size
      for index2 in 0 ... @users[index1].courses.size
        course = @users[index1].courses[index2] 
        if(course.courseName == courseNameParams && course.grade == gradeNameParams)
          flagHasTakenWithGrade = true
        end
      end
      if(!flagHasTakenWithGrade)
        @users.delete_at(index1)
      end
    end
    respond_to do |format|
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def new
  end
  

end
  end
end

