class Url < ApplicationRecord
  include UrlsHelper
  before_save {self.long = unify_link(long)}
  validates :long, presence: true, length: { minimum: 4 }
  URL_REGEXP = /\A(http:\/\/|https:\/\/|)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :long, format: { with: URL_REGEXP }
end
