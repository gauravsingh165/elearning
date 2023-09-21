class CoursesController < ApplicationController
      before_action :set_course, only: [:show, :edit, :update, :destroy]
    
     
      def index
        if params[:search]
          @courses = Course.where("name LIKE ?", "%#{params[:search]}%")
        else
          @courses = Course.all
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
          respond_to do |format|
            format.html { redirect_to courses_path, notice: "Product Line was successfully created." }
            format.turbo_stream
          end
        else
          render :new, status: :unprocessable_entity
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
        params.require(:course).permit(:name, :start_date, :end_date, :product_line_id, :product_version_id)
      end
    
end
