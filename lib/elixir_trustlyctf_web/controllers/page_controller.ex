defmodule ElixirTrustlyctfWeb.PageController do
  use ElixirTrustlyctfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def level1(conn, _params) do
    render(conn, "l1.html", level: current_path conn)
  end

  def level2(conn, _params) do
    render(conn, "l2.html", level: current_path conn)
  end

  def level4(conn, _params) do
    conn
    |> put_resp_cookie("flag", "flag{hungry}", path: current_path conn)
    |> render("l4.html", level: current_path conn)
  end

  def level7(conn, _params) do
    conn
    |> put_resp_header("here_is_the_flag", "flag{dimitrios}")
    |> render("l7.html", level: current_path conn)
  end

  def level9(conn, _params) do
    render(conn, "l9.html", level: current_path conn)
  end

  def level9_post(conn, params) do
    valid_usernames = ["Cisco", "admin", "none", "root"]
    valid_passwords = ["Cisco", "admin", "none", "password", "changeme"]
    if Enum.member?(valid_usernames, params["username"])
       and Enum.member?(valid_passwords, params["password"]) do
      conn
      |> put_flash(:info, "Logged in. The flag is: flag{lego}")
      |> render("l9.html", level: current_path conn)
    else
      conn
      |> put_flash(:error, "Invalid login")
      |> render("l9.html", level: current_path conn)
    end
  end

  def level12(conn, _params) do
    render(conn, "l12.html", level: current_path conn)
  end

  def level13(conn, _params) do
    render(conn, "l13.html", level: "13")
  end

  def level13_flag(conn, _params) do
    text conn, "The flag is: flag{tdd}"
  end
end
