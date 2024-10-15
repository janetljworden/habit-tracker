class HabitsController < ApplicationController
  before_action :load_task, except: [:new, :index, :create]
  def index
    @habits = Habit.all
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to habits_path, notice: "Habit Created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @habit.update habit_params
      redirect_to @habit, notice: "Habit Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_path, alert: "Habit Deleted."
  end

  private

  def habit_params
    params.require(:habit).permit(:name,:frequency,:start_date)
  end

  def load_task
    @habit = Habit.find params[:id]
  end

end
