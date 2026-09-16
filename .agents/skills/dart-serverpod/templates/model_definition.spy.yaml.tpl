# Define your PostgreSQL table and data serialization model here
# Save inside: lib/src/models/user_profile.spy.yaml

class: UserProfile
table: user_profile
fields:
  id: int?
  userId: int
  fullName: String
  email: String
  isActive: bool
  createdAt: DateTime
  metadata: Map<String, String>?
indexes:
  user_email_idx:
    fields: email
    unique: true
