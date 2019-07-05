require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GramsHelper. For example:
#
# describe GramsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GramsController, type: :controller do
  describe "grams#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "grams#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "grams#create action" do
  it "should successfully create a new gram in our database" do
    post :create, params: { gram: { message: 'Hello!' } }
    expect(response).to redirect_to root_path

    gram = Gram.last
    expect(gram.message).to eq("Hello!")
  end
end

end
