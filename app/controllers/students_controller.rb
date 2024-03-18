class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :edit_email, :update_email]
  before_action :assemble_enrollment_date, only: [:create, :update]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/:id
  # uisng set_student
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @editable_email_only = false
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      flash.now[:error] = "#{@student.errors.full_messages.join(', ')}"
      render :new
    end
  end

  # GET /students/:id/edit
  # uisng set_student
  def edit
    @editable_email_only = false
  end

  # PATCH/PUT /students/:id
  # uisng set_student
  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      flash.now[:error] = "#{@student.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  # DELETE /students/:id
  # uisng set_student
  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student was successfully destroyed.'
  end

  # GET /students/:id/edit_email
  # uisng set_student
  def edit_email
    @editable_email_only = true
  end

  # PATCH/PUT /students/:id/update_email
  # uisng set_student
  def update_email
    if @student.update(email_params)
      redirect_to @student, notice: 'Email was successfully updated.'
    else
      flash.now[:error] = 'There was a problem updating the email.'
      render :edit_email
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params[:student][:enrollment_date] ||= Date.today

    params.require(:student).permit(:first_name, :last_name, :email, "enrollment_date(1i)", "enrollment_date(2i)", "enrollment_date(3i)")
  end

  def email_params
    params.require(:student).permit(:email)
  end

  def assemble_enrollment_date
    if (params[:student].present? &&
      params[:student].has_key?("enrollment_date(1i)") &&
      params[:student].has_key?("enrollment_date(2i)") &&
      params[:student].has_key?("enrollment_date(3i)"))
      params[:student][:enrollment_date] = Date.new(
        params[:student].delete("enrollment_date(1i)").to_i,
        params[:student].delete("enrollment_date(2i)").to_i,
        params[:student].delete("enrollment_date(3i)").to_i)
    end
  end
end
