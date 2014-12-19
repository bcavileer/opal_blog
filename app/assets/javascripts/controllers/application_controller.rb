class ApplicationController < Clearwater::Controller
  view { ApplicationView.new }
  default_outlet { ApplicationIndexController.new }

  def current_user
    return @current_user if defined? @current_user
    @current_user = nil

    unless @loading_session
      HTTP.get('/api/v1/session') do |response|
        if response.ok? && response.json[:user]
          @current_user = User.new(response.json[:user])
          @loading_session = false
          call
        end
      end
    end

    @loading_session = true
    @current_user = nil
  end

  def signed_in?
    !!current_user
  end

  def sign_in attributes
    HTTP.post('/api/v1/session',
              beforeSend: set_csrf_token,
              payload: { session: attributes }) do |response|
      if response.ok?
        @current_user = User.new(response.json[:user])
        router.navigate_to '/'
      else
        alert 'Could not sign in.'
      end
    end
  end

  def sign_out
    HTTP.delete('/api/v1/session', beforeSend: set_csrf_token) do |response|
      if response.ok?
        @current_user = nil
        call
      else
        alert 'Could not tell the server to sign out.'
      end
    end
  end
end
