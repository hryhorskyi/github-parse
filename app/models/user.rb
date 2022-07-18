# frozen_string_literal: true

class User < ApplicationRecord
  serialize :repos, Array
end
