# frozen_string_literal: true

module Admin
  class HirersController < Admin::ApplicationController
    before_action :authorize_resources, only: %i[index create]
    before_action :authenticate_admin

    def index
      instance = Admin::Hirer::List.new(
        dashboard: dashboard,
        order: order,
        params: params,
        scoped_resource: scoped_resource
      ).call

      render locals: {
        resources: instance[:resources],
        search_term: instance[:search_term],
        page: instance[:page],
        show_search_bar: show_search_bar?
      }
    end

    def create
      instance = Admin::Hirer::Create.new(hirer_build: @resource_class).call

      if instance[:success]
        redirect_to(
          after_resource_created_path(instance[:hirer]),
          notice: translate_with_resource('create.success')
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, instance[:hirer])
        }, status: :unprocessable_entity
      end
    end

    def update
      instance = Admin::Hirer::Update.new(
        hirer: requested_resource,
        params: resource_params
      ).call

      if instance
        redirect_to(
          after_resource_updated_path(requested_resource),
          notice: translate_with_resource('update.success'),
          status: :see_other
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource)
        }, status: :unprocessable_entity
      end
    end

    def destroy
      instance = Admin::Hirer::Destroy.new(hirer: requested_resource).call

      if instance[:success]
        flash[:notice] = translate_with_resource(instance[:message])
      else
        flash[:error] = requested_resource.errors.full_messages.join(instance[:message])
      end

      redirect_to after_resource_destroyed_path(requested_resource), status: :see_other
    end

    private

    def authorize_resources
      if params[:action].to_sym == :create
        @resource_class = new_resource(resource_params)
        resource_class = @resource_class
      end

      authorize_resource(resource_class)
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes(action_name)).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-demo.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
