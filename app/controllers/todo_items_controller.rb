class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      redirect_to @todo_list, notice: "Todo Item added"
    else
      redirect_to @todo_list, notice: "Todo Item could not be added"
    end
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo item deleted"
    else
      flash[:error] = "Todo item could not be deleted"
    end
    redirect_to @todo_list
  end

  def complete
    if @todo_item.completed?
      @todo_item.update_attribute(:completed_at, "")
      redirect_to @todo_list, notice: "Todo Item uncompleted"
    else
      @todo_item.update_attribute(:completed_at, Time.now)
      redirect_to @todo_list, notice: "Todo Item completed"
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
