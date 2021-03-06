#
# Copyright (c) 2013 figo GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

require "flt"
require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative "../lib/figo"

AUTHORIZATION = {
  CLIENT_ID: "",
  CLIENT_SECRET: "",
  USERNAME: "",
  PASSWORD: "",
  AUTHORIZATION_CODE: ""
}

class FigoTest < MiniTest::Unit::TestCase

  def setup
    @sut = Figo::Session.new(CONFIG["ACCESS_TOKEN"])
  end

  # Obtain Authorization Code
  # login url
  # Credential Login
  # Exchange Authorization Code
  # Revoke Token
  # Exchange Refresh Token
  def test_authentification_features
    connection = Figo::Connection.new(CONFIG["CLIENT_ID"], CONFIG["CLIENT_SECRET"], "")

    refute_nil connection.login_url("qweqwe", "accounts=ro transactions=ro balance=ro user=ro")

    execption = assert_raises(Figo::Error) { connection.credential_login(CONFIG["USERNAME"], CONFIG["PASSWORD"]) }
    assert "Unsupported grant type.", execption.message
    # tokens = connection.credential_login(CONFIG["USERNAME"], CONFIG["PASSWORD"])

    # assert tokens.access_token
    # assert tokens.token_type
    # assert tokens.refresh_token

    # assert connection.obtain_access_token(CONFIG["AUTHORIZATION_CODE"])

    # assert connection.revoke_token(tokens.refresh_token)

    # assert connection.obtain_access_token(tokens.refresh_token)
  end
end
