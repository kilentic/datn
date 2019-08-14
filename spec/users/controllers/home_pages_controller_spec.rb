RSpec.describe Users::HomePagesController, type: :controller do 
  describe "Visit index page" do
    context "when non-logged-in user visit" do 
      it "should response with status 200" do 
        get :index 
        expect(response).to have_http_status(:success)
      end
    end
  end
end
