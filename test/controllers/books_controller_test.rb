require "test_helper"

class BooksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:one)
    @book_params = { title: "Test Book", author: "Test Author", url: "https://app.thestorygraph.com/books/tttttttt-tttt-tttt-tttt-tttttttttttt" }
  end

  test "index is public" do
    get :index
    assert_response :success
  end

  test "index shows only visible books" do
    get :index
    assert_response :success
    books = assigns(:books)
    assert_not_nil books
    assert_equal books.count, 2
    assert books.all? { |book| !book.hidden }
  end

  test "new is private" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "create is private" do
    post :create, params: { book: @book_params }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "edit is private" do
    book = books(:one)
    get :edit, params: { id: book.id }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "update is private" do
    book = books(:one)
    patch :update, params: { id: book.id, book: { title: "Updated Title" } }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "new book form is displayed" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "create book" do
    sign_in @user
    assert_difference("Book.count", 1) do
      post :create, params: { book: @book_params }
    end
    assert_redirected_to book_path(assigns(:book))
    assert_equal "Book was successfully created", flash[:notice]
  end

  test "create book with invalid data" do
    sign_in @user
    assert_no_difference("Book.count") do
      post :create, params: { book: { title: "", author: "", url: "" } }
    end
    assert_redirected_to new_book_path
    assert_match (/Error: Title can't be blank, Author can't be blank, Url can't be blank/), flash[:alert]
  end

  test "edit book" do
    sign_in @user
    book = books(:one)
    get :edit, params: { id: book.id }
    assert_response :success
  end

  test "update book" do
    sign_in @user
    book = books(:one)
    patch :update, params: { id: book.id, book: { title: "Updated Title", author: "Updated Author" } }
    assert_response :redirect
    assert_redirected_to book_path(assigns(:book))
    assert_equal "Book was successfully updated", flash[:notice]
  end

  test "update book with invalid data" do
    sign_in @user
    book = books(:one)
    patch :update, params: { id: book.id, book: { title: "", author: "" } }
    assert_response :redirect
    assert_redirected_to book_path(book)
    assert_match (/Error: Title can't be blank, Author can't be blank/), flash[:alert]
  end
end
