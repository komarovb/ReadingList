class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]
  # GET /books
  # GET /books.json
  def index
    @user = User.find_by(id: session[:user_id])
    if @user.role=="au"
      @books = Book.includes(:genres, :users).
      search(params[:keyword]).filter(params[:filter])
      @action_buttons=1
    else
      @books = Book.includes(:genres, :users).joins(:users).where('users.id = ?', session[:user_id]).
      search(params[:keyword]).filter(params[:filter])
      @action_buttons=3
    end
    @genres=Genre.all
    @add_panel=false
  end
  
  # GET /books/1
  # GET /books/1.json
  def show
  end
  # GET /books/new
  def new
    @book = Book.new
    @genres=Genre.all
  end
  def addNew
    @books = Book.includes(:genres, :users).
      search(params[:keyword]).filter(params[:filter])
    @action_buttons=2
    @add_panel=true
  end
  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @current_Genre=@book.genres
    @genres=Genre.all
  end
  def addBook
    @user = User.find_by(id: session[:user_id])
    @book_list = @user.books
    @msg=params[:msg]
    @msg.each do |b|
      @book_list << Book.find_by(id: b)
    end
    @user.update(books: @book_list)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Book was successfully added.' }
    end
  end
  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @user = User.find_by(id: session[:user_id])
    @book_list = @user.books
    respond_to do |format|
      if @book.save
        @book_list << @book if @user.role!="au"
        @user.update(books: @book_list)
        @user.save        
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
        format.js
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    #@book.destroy
    @user = User.find_by(id: session[:user_id])
    if @user.role=="au"
      @book.destroy
    else
      @user.books.delete(@book)
    end
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :amazon_id, {genre_ids: []}, :rating)
    end
end
