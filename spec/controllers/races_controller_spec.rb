require 'rails_helper'

describe RacesController do
    describe 'Get #new' do
        before do
            get :new
        end
        it 'normal response code' do
            expect(response.status).to eq 200
        end
        # it '@userに新しいユーザーを割り当てること' do
        #     expect(assigns(:user)).to be_a_new(User)
        # end
        it 'render_template' do
            expect(response).to render_template :new
        end
    end
end