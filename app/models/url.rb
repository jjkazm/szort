class Url < ApplicationRecord
  include UrlsHelper
  before_save {self.long = unify_link(long)}
end
