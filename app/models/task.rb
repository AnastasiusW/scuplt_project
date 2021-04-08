class Task < ApplicationRecord
  enum status: { new_status: 0, in_progress: 1, done: 2 }
  validates :task_number, presence: true
  validates :status, presence: true
  validates :date, presence: true
  VALIDATE_TASK_NUMBER = /(\d{4}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01]))-(\d{3})/.freeze
  validates :task_number, format: { with: VALIDATE_TASK_NUMBER,
                                    message: 'task number must be in format yyyymmdd-tasknumber ' }
end
