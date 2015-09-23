require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
let (:question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_boolean) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [question] to @questions" do
      get :index
      expect(assigns(:questions)).to eq([question])
    end
  end


# #1
   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end

  # #2
     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end

  # #3
     it "instantiates @question" do
       get :new
       expect(assigns(:question)).not_to be_nil
     end
   end

   describe "POST create" do
  # #4
     it "increases the number of Question by 1" do
       expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_boolean}}.to change(Question,:count).by(1)
     end

  # #5
     it "assigns the new question to @question" do
       post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_boolean}
       expect(assigns(:question)).to eq Question.last
     end

  # #6
     it "redirects to the new question" do
       post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_boolean}
       expect(response).to redirect_to Question.last
     end
   end

   describe "GET show" do
     it "returns http success" do
  # #16
       get :show, {id: question.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
  # #17
       get :show, {id: question.id}
       expect(response).to render_template :show
     end

     it "assigns question to @question" do
       get :show, {id: question.id}
  # #18
       expect(assigns(:question)).to eq(question)
     end
   end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: question.id}
# #1
      expect(response).to render_template :edit
    end

# #2
    it "assigns question to be updated to @question" do
      get :edit, {id: question.id}

      question_instance = assigns(:question)

      expect(question_instance.id).to eq question.id
      expect(question_instance.title).to eq question.title
      expect(question_instance.body).to eq question.body
      expect(question_instance.resolved).to eq question.resolved
    end
  end

  describe "PUT update" do
    it "updates question with expected attributes" do
     new_title = RandomData.random_sentence
     new_body = RandomData.random_paragraph
     new_resolved = RandomData.random_boolean

     put :update, id: question.id, question: {title: new_title, body: new_body, resolved: new_resolved}

     updated_question = assigns(:question)
     expect(updated_question.id).to eq question.id
     expect(updated_question.title).to eq new_title
     expect(updated_question.body).to eq new_body
     expect(updated_question.resolved).to eq new_resolved
    end

    it "redirects to the updated question" do
     new_title = RandomData.random_sentence
     new_body = RandomData.random_paragraph
     new_resolved = RandomData.random_boolean

     put :update, id: question.id, question: {title: new_title, body: new_body, resolved: new_resolved}
     expect(response).to redirect_to question
    end
  end

  describe "DELETE destroy" do
    it "deletes the question" do
     delete :destroy, {id: question.id}
     count = Question.where({id: question.id}).size
     expect(count).to eq 0
    end

    it "redirects to questions index" do
     delete :destroy, {id: question.id}
     expect(response).to redirect_to questions_path
    end
  end

end
