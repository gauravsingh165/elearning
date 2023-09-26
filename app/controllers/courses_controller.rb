class CoursesController < ApplicationController
      before_action :set_course, only: [:show, :edit, :update, :destroy]
    
      def index
        @courses = Course.all
        if params[:search]
          @courses = Course.where("name LIKE ?", "%#{params[:search]}%")
        else
          @courses = Course.all
        end
        case params[:course_type]
        when "Free"
          @courses = @courses.where(pver: "free")
        when "Paid"
          @courses = @courses.where(pver: "paid")
        when "Custom"
          @courses = @courses.where(pver: "custom")

        end
      
        @courses = @courses.order(:pver)
      
        respond_to do |format|
          format.html
          format.js   # This line should be included for AJAX requests
        end
      end
      def show
        @course = Course.find(params[:id])
        authorize! :read, @course
      end
      
    
      def new
        @course = Course.new
      end
    
      def create
        @course = Course.new(course_params)
        if @course.save
          render turbo_stream.replace("course", partial: "courses/course", locals: { course: @course })
        else
          render turbo_stream: turbo_stream.replace("course", partial: "courses/form", locals: { course: @course })
        end
      end
      
      
    
      def edit
      end
    
      def update
        if @course.update(course_params)
          redirect_to courses_path, notice: "Product Line was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def destroy
        @course.destroy
    
        respond_to do |format|
          format.html { redirect_to courses_path, notice: "Product Line was successfully destroyed." }
          format.turbo_stream
        end
      end
    
      private
    
      def set_course
        @course = Course.find(params[:id])
      end
    
      def course_params
        params.require(:course).permit(:name, :start_date, :end_date, :pver, :product_line_id, :product_version_id)
      end
      
    
end
