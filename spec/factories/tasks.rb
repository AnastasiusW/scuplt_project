FactoryBot.define do
  factory :task do
    task_number { '20201010-0001' }
    comment { 'ololol' }
    date { Date.today }
    status { 'new_status' }
  end
end
