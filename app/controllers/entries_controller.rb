class EntriesController < ApplicationController
  before_action :load_task
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

  private

  def entry_params
      params.require(:entry).permit(:date,:status,:notes)
  end

  def load_task
    @habit = Habit.find params[:habit_id]
  end

  def load_entry
    @entry = Entry.find params[:id]
  end
end
