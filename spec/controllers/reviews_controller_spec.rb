require 'rails_helper'

describe ReviewsController do
    describe 'Get #index' do
        before do
            get :index
        end
        it 'normal response code' do
            expect(response.status).to eq 200
        end
        it 'render_template' do
            expect(response).to render_template :index
        end
    end
end