RSpec.describe Services::Tasks::Index do
  subject(:service) { described_class.new(params) }

  let!(:task1) { create(:task) }
  let!(:task2) { create(:task) }
  let!(:task3) { create(:task) }
  let!(:task4) { create(:task) }

  context 'when specific task' do
    let(:params) { { task_id: task3.id } }

    it 'return task3' do
      expect(service.call).to eq([task3])
    end
  end

  context 'when empty params' do
    let(:params) { { task_id: '' } }

    it 'return all tasks'  do
      expect(service.call).to match_array([task1, task2, task3, task4])
    end
  end
end
