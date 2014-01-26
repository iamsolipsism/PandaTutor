class CoursesController < ApplicationController
   before_action :signed_in_user, only: [:create, :destroy]
 def new
        @course = Course.new("NOTHING","F")
    end
 def create
    @courses = current_user.courses.build(course_params)
    if @courses.save
      flash[:success] = "Course successfully saved!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def course_params
      params.require(:course).permit(:courseName, :grade)
    end
end
