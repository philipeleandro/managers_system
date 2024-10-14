# frozen_string_literal: true

module Admin
  class RecruitmentsController < Admin::ApplicationController
    before_action :authorize_by_action, only: %i[index create]

    def index
      instance = Admin::Recruitment::List.new(
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
      instance = Admin::Recruitment::Create.new(recruitment_build: @resource_class).call

      if instance[:success]
        redirect_to(
          after_resource_created_path(instance[:recruitment]),
          notice: translate_with_resource('create.success')
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, instance[:recruitment])
        }, status: :unprocessable_entity
      end
    end

    def update
      instance = Admin::Recruitment::Update.new(
        recruitment: requested_resource,
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
      instance = Admin::Recruitment::Destroy.new(recruitment: requested_resource).call

      if instance[:success]
        flash[:notice] = translate_with_resource(instance[:message])
      else
        flash[:error] = requested_resource.errors.full_messages.join(instance[:message])
      end

      redirect_to after_resource_destroyed_path(requested_resource), status: :see_other
    end
  end
end
