class Access < ApplicationRecord
  belongs_to :user

  belongs_to :issuer, class_name: "User"

  enum state: [:open, :approved, :rejected, :revoked]

  enum kind: [:admin, :tester, :developer, :sales]
end
