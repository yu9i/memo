<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="index.css">
  <script src="JS/jquery-3.6.1.min.js"></script>
  <script src="JS/index.js" type="text/javascript"></script>
  <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
      rel="stylesheet"
    />
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <title>final project</title>
</head>

<body>
    <header class="header">
        <div><h1>My Note <i class="bi bi-journal"></i></h1></div>
        <div class="logout"><a href="index.html">Log Out</a></div>
    </header>
    <% String username="";
        try{
            String userid = request.getParameter("userid");   
            String password = request.getParameter("userpw");
            if(userid.length() < 1 || password.length() < 1){
                %>
                <div class="login">
                    <h3>Please write your information!!</h3>
                </div>
                <%
                return;
            }

            Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/website_info?" + "user=root&password=root");
            PreparedStatement pst = conn.prepareStatement("Select userName,password,idusers from users where idusers=? and password=?");
            pst.setString(1, userid);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();                        
            if(rs.next()){
                username = rs.getString("userName");
            }
            else{
                username = "";
                %>
                <div class="signin">
                    <h2>Something went wrong!! Please try again</h2>
                </div>
                <%
                return;
            }
        }
        catch(Exception e){ 
            %>
            <div class="signin">
                <h2>Something went wrong!! Please try again</h2>
            </div>
            <%
            return;
        }
    %>
    <div class="beforeadd">
        <div class="signin">
            <h3>Welcome, you logined as: <%=username%>  </h3>
        </div>
        <%String name="";
        String title="";
        String content="";
        %>
        <div class="container">
            <div class="memo" id="addmemo">
            <h2>Please CLICK To ADD Your Memo :)</h2>
            </div>
            <%try{
                Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/website_info?" + "user=root&password=root");
                PreparedStatement pst = conn.prepareStatement("Select * from memo");
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                    name = rs.getString("memowho");
                    title = rs.getString("title");
                    content = rs.getString("content");
                    %>
                    <div class="memo memo-detail">
                        <p id="upper"><%= rs.getString("title")%> by <%= rs.getString("memowho")%></p>
                        <p id="lower"><%= rs.getString("content")%></p>
                    </div>
                    <%
                }
            }catch(Exception e){ 
                e.printStackTrace();
            }
            %>
        </div>
    </div>
    <div class="showmemo">
        <div class="Amemo">
            <div id="memodetail"></div>
            <button class="close">Close</button>
        </div>
    </div>
    <div class="afteradd">
        <div class="addmemo">
            <h3>Fill in Memo information</h3>
            <form class="memo-form" action="validate_memo.jsp" method="post">
                <div>
                    Writer<br>
                    <input type="text" name="username" readonly value=<%=username %>>
                </div>
                <div>
                    Title<br>
                    <input type="text" name="title" value="" maxlength="40" placeholder="Up to 45 chars">
                </div>
                <div>
                    Content<br>
                    <textarea  name="content" value="" maxlength="500" placeholder="Up to 500 chars"></textarea>
                </div>
                <div>
                    <td><button type="submit" name="addbutton">Add</button></td>
                    <td><button type="reset" name="addbutton">Cancel</button></td>
                </div>
            </form>
            <button class="back">Back to main page</button>
        </div>
    </div>
</body>
</html>