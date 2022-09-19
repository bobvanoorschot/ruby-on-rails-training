class CrudController < ApplicationController
    before_action :set_resource, only: %i[show]


    def index
        instance_variable_set("@#{model_name.pluralize}", model.all)
    end

    def show; end

    def new
        instance_variable_set("@#{model_name}", model.new)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
        instance_variable_set("@#{model_name}", model.find(params[:id]))
    end

    def model
        model_name.capitalize.constantize
    end
end