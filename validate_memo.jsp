<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%@ page import ="java.sql.*" %>
        <%
            try{
                String name = request.getParameter("username");
                String title = request.getParameter("title");   
                String content = request.getParameter("content");
                if(title.length() < 1 || content.length() < 1){
                    %>
                    <h3>Please fill title and content!!</h3>
                    <button class="back" onClick="history.back()">Back to Main page</button>

                    <%
                    return;
                }

                Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/website_info?" + "user=root&password=root");
                String sql = "insert into memo(memowho,title,content)values(?,?,?)";
                PreparedStatement ps = null;
                ps = conn.prepareStatement(sql);   
                ps.setString(1, name);
                ps.setString(2, title);
                ps.setString(3, content);

                int i=ps.executeUpdate();
            }
            catch(Exception e){ 
                %>
                <div class="erroradd">
                    <h2>Something went wrong!! Please try again</h2>
                    <button class="back" onClick="history.back()">Back to Main page</button>
                </div>
                <%
                return;
            }
        %>

    <div class="successadd">
        <h2>Success to Add!</h2>
        <button class="back" onClick="history.back()">Back to Main page</button>
    </div>


</body>
</html>