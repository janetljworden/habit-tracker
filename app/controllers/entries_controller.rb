class EntriesController < ApplicationController
  before_action :authenticate
  before_action :load_habit
  before_action :load_entry, except: [:index, :new, :create]
  
  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params
    if @habit.entries << @entry
      redirect_to habit_entry_path(@habit,@entry), notice: "Entry Created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entry.update entry_params
      redirect_to habit_entry_path(@habit,@entry), notice: "Entry Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    redirect_to habit_entries_path(@habit), alert: "Entry Deleted."
  end

  private

  def entry_params
      params.require(:entry).permit(:date,:status,:notes)
  end

  def load_entry
    @entry = @habit.entries.find params[:id]
  end
  
  def load_habit
    @habit = current_user.habits.find params[:habit_id]
  end
end
