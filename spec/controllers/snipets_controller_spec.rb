require 'rails_helper'
require_relative '../support/shared'

describe SnipetsController do

  let(:current_user){build_stubbed(:user)}
  let(:all_snippets){build_list(:snipet, 10)}
  let(:generic_snippet){build_stubbed(:snipet)}

  before do
    sign_in current_user
    allow(Snipet).to receive(:find_by_id).and_return(generic_snippet)
  end
  
  describe "GET #index" do
    before do
      sign_out current_user
      expect(Snipet).to receive(:all).and_return(all_snippets)
    end

    it "call all snippets and render index template" do
      expect(get :index).to render_template(:index)
    end
  end
  
  describe "GET #my_snipets" do
    before{expect(Snipet).to receive(:where).and_return(all_snippets)}
    it "call user's snippets and render index template" do
      expect(get :my_snipets, :id => current_user.id).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "the snippet exists" do
      it "find the snippet with the given id and render show template" do
        expect(get :show, :id => generic_snippet.id).to render_template(:show)
      end
    end
    context "the snippet doesn't exists" do
      before{expect(Snipet).to receive(:find_by_id).and_return(nil)}
      it "redirect to index template" do
        expect(get :show, :id => 99).to redirect_to(:action => :index)
      end
    end
  end

  describe "GET #new" do
    before{expect(Snipet).to receive(:new).and_return(nil)}
    it "call new method and display new template" do
      expect(get :new).to render_template(:new)
    end
  end

  describe "GET #edit"do 
     context "the snippet exists" do
      it "find the snippet with the given id and render edit template" do
        expect(get :edit, :id => generic_snippet.id).to render_template(:edit)
      end
     end
    context "the snippet doesn't exists" do
      before{expect(Snipet).to receive(:find_by_id).and_return(nil)}
      it "redirect to index template" do
        expect(get :edit, :id => 99).to redirect_to(:action => :index)
      end
    end
  end

  describe "POST #create" do
    before{expect(Snipet).to receive(:new).and_return(generic_snippet)}
    context "the snippet is valid" do
      it "call save on the snippet and redirect to my_snippets" do
        expect(generic_snippet).to receive(:save).and_return(generic_snippet)
        expect(post :create, :snipet => generic_snippet.attributes).to redirect_to(:action => :my_snipets, :id => current_user.id)
      end
    end
    context "the snippet is not valid" do
      it "render template new" do
        expect(generic_snippet).to receive(:save).and_return(false)
        expect(post :create, :snipet => generic_snippet.attributes).to render_template(:new)
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "the snippet is valid" do
      before{expect(generic_snippet).to receive(:update).and_return(true)}
      it "call update on the snippet and redirect to show snippet" do
        expect(put :update, :id => generic_snippet.id, :snipet => generic_snippet.attributes).to redirect_to(:action => :show, :id => generic_snippet.id)
      end
    end
    context "the snippet is not valid" do
      before{expect(generic_snippet).to receive(:update).and_return(false)}
      it "render template edit" do
        expect(put :update, :id => generic_snippet.id, :snipet => generic_snippet.attributes).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    context "the snippet exists" do
      before{expect(generic_snippet).to receive(:destroy).and_return(true)}
      it "call delete on the snippet and redirect_to all snippets" do
        expect(delete :destroy, :id => generic_snippet.id).to redirect_to(:action => :index)
      end
    end
    context "the snippet doesn't exist" do
      before{expect(Snipet).to receive(:find_by_id).and_return(nil)}
      it "redirect to all snippets" do
        expect(delete :destroy, :id => generic_snippet.id).to redirect_to(:action => :index)
      end
    end
  end

  describe "PUT #star" do
    before{expect(Snipet).to receive(:find_by_id).and_return(generic_snippet)}
    it "call snipet#toggle_star" do
      expect(generic_snippet).to receive(:toggle_star)
      put :star, :id => generic_snippet.id
    end
    it_behaves_like "the snippet doesn't have a star yet"
    #context "the snippet doesn't have a star yet" do
      #it "return unstarred JSON response" do
        #put :star, :id => generic_snippet.id
        #json_response = JSON.parse(response.body)
        #expect(json_response["starred"]).to be_truthy
      #end
    #end
    it_behaves_like "the snippet already has a star"
      #it "return starred JSON response" do
        #expect(generic_snippet).to receive(:toggle_star).and_return(false)
        #put :star, :id => generic_snippet.id
        #json_response = JSON.parse(response.body)
        #expect(json_response["starred"]).to be_falsy
      #end
    #end
    it "return a OK status" do
      allow(generic_snippet).to receive(:toggle_star)
      put :star, :id => generic_snippet.id
      expect(response).to have_http_status(200)
    end

  end

  describe "GET #star_info" do
    before{expect(Snipet).to receive(:find_by_id).and_return(generic_snippet)}
    it "call snipet#toggle_star" do
      stars = double("stars")
      expect(stars).to receive(:where).and_return([generic_snippet])
      expect(stars).to receive(:count).and_return(2)
      expect(generic_snippet).to receive(:stars).twice.and_return(stars)
      get :star_info, :id => generic_snippet.id
      expect(response).to have_http_status(200)
    end
    it_behaves_like "the snippet doesn't have a star yet"
    it_behaves_like "the snippet already has a star"
  end

end
