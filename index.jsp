<!DOCTYPE html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="index.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
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
        <div class="logsignin">
          <div><a href="login.html">Log In</a></div>
          <div><a href="signin.html">Sign Up</a></div>
        </div>
    </header>
    <%@ page import ="java.sql.*" %>
    <% String username="";
        try{
            
            String userid = request.getParameter("userid");   
            String password = request.getParameter("userpw");
            username = request.getParameter("username");
            if(userid.length() < 1 || password.length() < 1 || username.length() < 1){
                %>
                <div class="signin">
                    <h3>Please write your information!!</h3>
                </div>
                <%
                return;
            }
            Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/website_info?" + "user=root&password=mysql913");    
             
            String sql = "insert into users(idusers,password,userName)values(?,?,?)";
            PreparedStatement ps = null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, password);
            ps.setString(3, username);
            
            int i=ps.executeUpdate();
            if(i==0)  {         
                username = "";   
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
    <div class="signin">
        <h3>You successfully signed up!</h3>
    </div>
</body>
</html>