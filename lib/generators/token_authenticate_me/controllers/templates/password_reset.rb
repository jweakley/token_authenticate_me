require 'token_authenticate_me/controllers/password_resetable'

class <%= class_name %>PasswordResetsController < ApplicationController
  include TokenAuthenticateMe::Controllers::PasswordResetable

end