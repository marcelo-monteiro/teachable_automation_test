# frozen_string_literal: true

module ScrollHelper
  include Capybara::DSL

  def scroll_to_top
    page.execute_script "window.scrollTo({ top: 0, behavior: 'smooth' })"
  end

  def scroll_to_bottom
    page.execute_script "window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' })"
  end
end
