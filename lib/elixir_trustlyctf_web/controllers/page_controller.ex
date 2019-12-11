defmodule ElixirTrustlyctfWeb.PageController do
  use ElixirTrustlyctfWeb, :controller

  def row_to_map(col_nms, vals) do
    Stream.zip(col_nms, vals)
    |> Enum.into(Map.new(), & &1)
  end

  def result_to_maps(%Postgrex.Result{columns: _, rows: nil}), do: []

  def result_to_maps(%Postgrex.Result{columns: col_nms, rows: rows}) do
    Enum.map(rows, fn row -> row_to_map(col_nms, row) end)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def level1(conn, _params) do
    render(conn, "l1.html", level: current_path(conn))
  end

  def level2(conn, _params) do
    render(conn, "l2.html", level: current_path(conn))
  end

  def level4(conn, _params) do
    conn
    |> put_resp_cookie("flag", "flag{hungry}", path: current_path(conn))
    |> render("l4.html", level: current_path(conn))
  end

  def level7(conn, _params) do
    conn
    |> put_resp_header("here_is_the_flag", "flag{dimitrios}")
    |> render("l7.html", level: current_path(conn))
  end

  def level9(conn, _params) do
    render(conn, "l9.html", level: current_path(conn))
  end

  def level9_post(conn, params) do
    valid_usernames = ["Cisco", "admin", "none", "root"]
    valid_passwords = ["Cisco", "admin", "none", "password", "changeme"]

    if Enum.member?(valid_usernames, params["username"]) and
         Enum.member?(valid_passwords, params["password"]) do
      conn
      |> put_flash(:info, "Logged in. The flag is: flag{lego}")
      |> render("l9.html", level: current_path(conn))
    else
      conn
      |> put_flash(:error, "Invalid login")
      |> render("l9.html", level: current_path(conn))
    end
  end

  def level12(conn, _params) do
    render(conn, "l12.html", level: current_path(conn))
  end

  def level13(conn, _params) do
    render(conn, "l13.html", level: "13")
  end

  def level13_flag(conn, _params) do
    text(conn, "The flag is: flag{tdd}")
  end

  def level15(conn, _params) do
    render(conn, "l15.html", level: current_path(conn))
  end

  def level15_post(conn, params) do
    query_string = params["name"]

    content =
      Ecto.Adapters.SQL.query!(
        ElixirTrustlyctf.Repo,
        "SELECT name,data from contents WHERE name=\'#{query_string}\'",
        []
      )

    raw_data = result_to_maps(content)
    render(conn, "l15r.html", level: current_path(conn), data: raw_data)
  end

  def level16(conn, _params) do
    render(conn, "l16.html", level: current_path(conn))
  end

  def level17(conn, _params) do
    render(conn, "l17.html", level: current_path(conn))
  end

  def level19(conn, _params) do
    render(conn, "l19.html", level: current_path(conn))
  end

  def level19_post(conn, params) do
    right_answer = ["Trustly", "trustly", "TRUSTLY"]

    if Enum.member?(right_answer, params["company"]) do
      conn
      |> put_flash(:info, "Well done. The flag is: flag{oscar}")
      |> render("l19.html", level: current_path(conn))
    else
      conn
      |> put_flash(:error, "Not quite")
      |> render("l19.html", level: current_path(conn))
    end
  end

  def level20(conn, _params) do
    render(conn, "l20.html", level: current_path(conn))
  end

  def level22(conn, _params) do
    secret_header = Plug.Conn.get_req_header(conn, "secret")
    IO.inspect(secret_header)

    if hd(secret_header) == "Innovation" do
      conn
      |> put_flash(:info, "Well done. The flag is: flag{awesome}")
      |> render("l22.html", level: current_path(conn))
    else
      render(conn, "l22.html", level: current_path(conn))
    end
  end

  def level23(conn, _params) do
    render(conn, "l23.html", level: current_path(conn))
  end

  def level23_flag(conn, _params) do
    text(conn, "flag{ultron}")
  end

  def level24(conn, _params) do
    userAgent = hd(Plug.Conn.get_req_header(conn, "user-agent"))

    if Browser.mobile?(userAgent) do
      conn
      |> put_flash(:info, "Well done. The flag is: flag{anna}")
      |> render("l24.html", level: current_path(conn))
    else
      render(conn, "l24.html", level: current_path(conn))
    end
  end

  def level25(conn, _params) do
    render(conn, "l25.html", level: current_path(conn))
  end
  def level25_post(conn, params) do
    creditcard = params["creditcard"]
    case CcValidation.validate(creditcard) do
      {:ok, true} ->
        conn
        |> put_flash(:info, "Thank you. The flag is: flag{money}")
        |> render("l25.html", level: current_path conn)
      {:error, false} ->
        conn
        |> put_flash(:error, "#{creditcard} is not a valid credit card number")
        |> render("l25.html", level: current_path(conn))
    end
  end

  def level26(conn, _params) do
    render(conn, "l26.html", level: current_path(conn))
  end

  def level26_post(conn, _params) do
    userAgent = hd(Plug.Conn.get_req_header(conn, "user-agent"))

    if Browser.bot?(userAgent) do
      conn
      |> put_flash(:info, "Well done. The flag is: flag{bing}")
      |> render("l26.html", level: current_path(conn))
    else
      conn
      |> put_flash(:error, "You are not Google! You are #{userAgent}")
      |> render("l26.html", level: current_path(conn))
    end
  end
  def level27(conn, _params) do
    cookies = conn.cookies["is_admin"]
    case cookies do
      nil ->
        conn
        |> put_resp_cookie("is_admin", "0", path: current_path(conn))
        |> put_flash(:error, "You need to be an admin to access the full page")
        |> render("l27.html", level: current_path(conn))
      "0" ->
        conn
        |> put_flash(:error, "You need to be an admin to access the full page")
        |> render("l27.html", level: current_path(conn))
      "1" ->
        conn
        |> put_flash(:info, "Welcome admin. The flag is: flag{john}")
        |> render("l27.html", level: current_path(conn))
    end
  end

  def level29(conn, _params) do
    ip = List.first(Plug.Conn.get_req_header(conn, "x-forwarded-for"))
    case ip do
      nil ->
        conn
        |> put_flash(:error, "This page is only accessible from 1.1.1.1")
        |> render("l29.html", level: current_path(conn))
      "1.1.1.1" ->
        conn
        |> put_flash(:info, "Welcome internal user. The flag is: flag{dorna}")
        |> render("l29.html", level: current_path(conn))
      _ ->
          conn
          |> put_flash(:error, "This page is only accessible from 1.1.1.1")
          |> render("l29.html", level: current_path(conn))
    end
  end

  def level30(conn, _params) do
    render(conn, "l30.html", level: current_path(conn))
  end

  def level30_delete(conn, _params) do
    text conn, "flag{swtor}"
  end

  def level30_get(conn, _params) do
    text conn, "Nothing here"
  end
end
