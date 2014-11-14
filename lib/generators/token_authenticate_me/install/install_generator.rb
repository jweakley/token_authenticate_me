module ApiMe
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def run_generators
        params = @_initializer[0]
        
        invoke 'token_authenticate_me:model', params
        invoke 'token_authenticate_me:controllers', params
      end
    end
  end
end
