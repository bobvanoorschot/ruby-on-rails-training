module Admin
    

class AdminController < ApplicationController
    before_action :check_if_admin

    def check_if_admin
    end
end
end