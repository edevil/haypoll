defmodule Haypoll.PageControllerTest do
  use Haypoll.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix10!"
  end
end
