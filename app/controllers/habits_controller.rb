class HabitsController < ApplicationController
  before_action :load_task, except: [:new, :index, :create]
  
  # GET /habits
  # retrieves and displays all habits
  def index
    @habits = Habit.all
  end

  # GET /habits/new
  # displays the form for creating a new habit
  def new
    @habit = Habit.new
  end

  # POST /habits
  # submits the form data to create a new habit
  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to habits_path, notice: "Habit Created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /habits/:id
  # displays a specific habit by its ID
  def show
  end

  # GET /habits/:id/edit
  # displays the form for editing a specific habit
  def edit
  end

  # PATCH /habits/:id
  # updates the specific habit with the submitted form data
  def update
    if @habit.update habit_params
      redirect_to @habit, notice: "Habit Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /habits/:id
  # deletes a specific habit by its ID
  def destroy
    @habit.destroy
    redirect_to habits_path, alert: "Habit Deleted."
  end

  private

  # allow specific attributes for mass assignment
  def habit_params
    params.require(:habit).permit(:name,:frequency,:start_date)
  end

  # loads a specific habit based on its ID
  def load_task
    @habit = Habit.find params[:id]
  end

end
