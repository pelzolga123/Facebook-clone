def mock_auth_hash
  # The mock_auth configuration allows you to set per-provider (or default)
  # authentication hashes to return during integration testing.
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    'provider' => 'facebook',
    'uid' => '123545',
    'info' => {
      'email' => 'dpsk@email.ru',
      'name' => 'Mario Brothers',
      'image' => ''
    },
    'credentials' => {
      'token' => '12345',
      'expires_at' => 1_486_718_672,
      'expires' => true
    },
    'extra' => {
      'raw_info' => {
        'email' => 'dpsk@email.ru',
        'name' => 'Mario Brothers',
        'id' => '12345'
      }
    }
  )
end
