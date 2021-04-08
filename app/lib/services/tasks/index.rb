module Services
  module Tasks
    class Index
      def initialize(**params)
        @params = params
      end

      def call
        task_filter
      end

      def task_filter
        return Task.all unless @params[:task_id].present?

        Task.where(id: @params[:task_id])
      end
    end
  end
end
