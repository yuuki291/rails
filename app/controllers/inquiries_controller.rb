class InquiriesController < ApplicationController
def index
    @members = Form.order("name")
end

def show
end

def new
    @article = Form.new
end

def edit
    @article = Form.find(params[:id])
end

def create
    @article = Form.new(form_params)
    if @article.save
        redirect_to :action => "index" , notice: "登録完了"
    else
        render "new"
    end
end

def update
    @article = Form.find(params[:id])
    @article.assign_attributes(form_params)
    if @article.save
        redirect_to :action => "index" , notice: "変更完了"
    else
        render "edit"
    end

end

def destroy
    @article = Form.find(params[:id])
    @article.destroy
    redirect_to :action => "index" ,notice:"削除完了"
end

private 

def form_params
params.require(:form).permit(
    :name,
    :phone,
    :adress,
    :form
)
end

end
