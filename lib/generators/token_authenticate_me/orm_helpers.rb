module TokenAuthenticateMe
  module Generators
    module OrmHelpers
      def model_contents
        buffer = <<-CONTENT
  has_secure_password

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates :username,
    format: { with: /\A[a-zA-Z0-9]+\Z/ },
    presence: true,
    uniqueness: { case_sensitive: false }
CONTENT
        buffer
      end

      private

      def model_exists?
        File.exist?(File.join(destination_root, model_path))
      end

      def migration_exists?(table_name)
        Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb")
          .grep(/\d+_add_token_authenticate_me_to_#{table_name}.rb$/).first
      end

      def migration_path
        @migration_path ||= File.join('db', 'migrate')
      end

      def model_path
        @model_path ||= File.join('app', 'models', "#{file_path}.rb")
      end
    end
  end
end