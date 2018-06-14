# == Schema Information
#
# Table name: urls
#
#  id          :integer          not null, primary key
#  real_path   :string
#  shorty_path :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'uri'

class Url < ApplicationRecord

  validate :valid_real_path?

  private

  def valid_real_path?
    uri = URI.parse(real_path)
    return if %w( http https ).include?(uri.scheme)
    errors.add(:real_path, real_path_error_message)
  rescue URI::InvalidURIError => e
    errors.add(:real_path, real_path_error_message)
  end

  def real_path_error_message
    "Invalid url entered: #{real_path}"
  end
end
