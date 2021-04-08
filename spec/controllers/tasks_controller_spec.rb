RSpec.describe TasksController, type: :controller do
  let!(:user) { create(:user) }
  let(:task) { create(:task) }
  let(:task1) { create(:task) }
  let(:task2) { create(:task) }
  let(:valid_params) { { task: attributes_for(:task) } }
  let(:invalid_params) { { task: { task_number: '',  status: 'new_status', date: Date.today, comment: '' } } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    it 'when user create task with success' do
      post :create, params: valid_params
      expect(flash[:notice]).to eq(I18n.t('flash.create'))
    end

    it 'when user create review with fails' do
      post :create, params: invalid_params
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    let(:valid_params) { { task_id: task2.id } }

    it 'when show task2 with success' do
      post :index, params: valid_params
      expect(response).to render_template :index
    end

    it 'when show all task with success' do
      post :index
      expect(response).to render_template :index
    end
  end

  describe 'PUT #update' do
    let(:valid_params) do
      { task:
      {
        task_number: task1.task_number,
        comment: task1.comment,
        date: task1.date,
        status: task1.status
      },
        id: task1.id }
    end

    let(:invalid_params) do
      { task:
      {
        task_number: '',
        comment: '',
        date: '',
        status: ''
      },
        id: task1.id }
    end

    it 'when user update task with success' do
      put :update, params: valid_params
      expect(response).to redirect_to(task_path(task1))
    end

    it 'when user update task with fails' do
      put :update, params: invalid_params
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it 'renders :show template' do
      get :show, params: { id: task1.id }
      expect(response).to render_template :show
    end
  end
end
