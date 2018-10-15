<%-- 
    Document   : posts
    Created on : 2018-09-18, 09:38:42
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../favicon.ico">

    <title>JSP Page</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <link href="CSS/blog.css" rel="../stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="loadPosts.js" type="text/javascript"></script> 
    <script src="loadPagination.js" type="text/javascript"></script> 
    <script src="paginationOnClick.js" type="text/javascript"></script> 
   
     <script src="../JS/fonctionUtilitaire.js" type="text/javascript"></script>
     
    <script src="fastselect.standalone.js"></script> 
     
    <script src="Pagination/paginationHandler.js" type="text/javascript"></script>    
    <script src="Pagination/readyLoadPagination.js" type="text/javascript"></script> 
    <script src="Tag/readyLoadTag.js" type="text/javascript"></script> 
    
    <script src="Post/postHandler.js" type="text/javascript"></script>
    <script src="Post/ajaxLoadPost.js" type="text/javascript"></script>    
    <script src="Post/readyLoadPost.js" type="text/javascript"></script> 
    <script src="Post/openPost.js" type="text/javascript"></script> 
    
    <%@ page import = "java.sql.*" %>
<%@ page import = "java.util.logging.Logger" %>
<%@ page import = "java.util.logging.Level" %>
    
  </head>   
    <body>
         <div class="container">
      <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1">
            <% boolean connected = isConnected();
            if (connected) {%>
                <a class="text-muted" href="../ModifyDeletePost.jsp">Mes publications</a>
            <%} else {%>
                <a style="top:0;" class="text-muted">Programmation web 2018</a>
           <%}%>
              <a href="createPost.jsp" class="blog-header-logo text-dark">Create</a>
              <a href="modDeleteExemple.jsp" class="blog-header-logo text-dark">Modify/Delete</a>
          </div>
          <div class="col-4 text-center" style="top:10px;">
            <h2 class="d-inline-block mb-2 text-success">SEXY BLOG</h2>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center" style="top:5px;">
              <%
              if (!connected) {%>
              <div>
              <button id="inscription" type="button" style="margin-right: 15px" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" data-placement="bottom" title="Nouveau compte">S'inscrire</button>
              <ul id="signup-nav" class="dropdown-menu">
                    <li><form id="register" class="registerForm" role="form" method="post" action="./Login/SignUp.jsp" accept-charset="UTF-8" id="signup-nav">
                            <div class="form-group" style="margin-right:10px; margin-left:10px;">
                                <label class="sr-only" for="exampleInputName">Nom complet</label>
                                <input type="signupName" name="signupName" class="form-control" id="signupName" placeholder="Nom complet" required>
                            </div>
                            <div class="form-group" style="margin-right:10px; margin-left:10px;">
                                <label class="sr-only" for="exampleInputEmail"> Votre e-mail</label>
                                <input type="email" name="signupEmail" class="form-control" id="signupEmail" placeholder="Adresse Mail" required>
                            </div>
                            <div class="form-group" style="margin-right:10px; margin-left:10px;">
                                <label class="sr-only" for="exampleInputPassword">Nouveau mot de passe</label>
                                <input type="password" name="signupPassword" class="form-control" id="signupPassword" placeholder="Mot de passe" required>
                            </div>
                            <div class="form-group" style="margin-right:15px; margin-left:15px;">
                                <button type="submit" class="btn btn-primary btn-block">S'inscrire</button>
                            </div>
                            <div class="checkbox">
                                <label>
                                <input style="margin-left: 35px;" type="checkbox"> Rester connecté
                                </label>
                            </div>
                        </form>
                </ul>
              </div>
              <div>
              <button id="connection" type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" data-placement="bottom" title="Compte existant">Se connecter</button>
                <ul id="login-dp" class="dropdown-menu">
                    <li><form id="login" class="loginForm" role="form" method="post" action="./Login/SignIn.jsp" accept-charset="UTF-8" id="login-nav">
                            <div class="form-group" style="margin-right:10px; margin-left:10px;">
                                <label class="sr-only" for="exampleInputName2">E-mail</label>
                                <input type="signinName" name="signinName" class="form-control" id="exampleInputEmail2" placeholder="Adresse Mail" required>
                            </div>
                            <div class="form-group" style="margin-right:10px; margin-left:10px;">
                                <label class="sr-only" for="exampleInputPassword2">Mot de passe</label>
                                <input type="password" name="signinPassword" class="form-control" id="exampleInputPassword2" placeholder="Mot de passe" required>
                                <div class="help-block text-right" style="margin-top:5px;">
                                    <a style="margin-right: 35px;color:blue;">Mot de passe oublié ?</a></div>
                            </div>
                            <div class="form-group" style="margin-right:15px; margin-left:15px;">
                                <button type="submit" class="btn btn-primary btn-block">Se connecter</button>
                            </div>
                            <div class="checkbox">
                                <label>
                                <input style="margin-left: 35px;" type="checkbox"> Rester connecté
                                </label>
                            </div>
                        </form>
                </ul>
              </div>
              <%} else {
                String name = findUserName();
              %> 
                <h6 class="p-2 text-muted" style="margin-top:10px;margin-right:-10px;">Bonjour</h6>
                <strong class="p-2 text-muted" style="margin-right: 25px;"><%=name%></strong>
                        <form id="register" class="logoutForm" method="post" action="./Login/Logout.jsp" accept-charset="UTF-8" id="signup-nav">
                            <button type="submit" class="btn btn-outline-secondary"  title="Compte existant">Se Déconnecter</button>
                        </form>
                <%}%>
      </header>

      <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between" id="tag_category" id="tag_category">
     
        </nav>
      </div>
        <div id="posts" name="posts">
           
        </div>
        <div id="pagination" name="pagination">
           
        </div>         
        
     <footer class="blog-footer">  
      <p>
        <a href="blog.jsp">Back to home</a>
      </p>
    </footer>
      
      <%!
    public Connection connectToBD() {
        Connection conn = null; 
        try {
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           conn = DriverManager.getConnection(
                "jdbc:mysql://localhost/sexy-blog?verifyServerCertificate=false&useSSL=false&serverTimezone=UTC" + 
                    "&user=" +
                    "root" + 
                    "&password=" +
                    "");
            return conn;
        } catch (Exception e) {
            return null;
        }
    }

    public String findUserName() {
        PreparedStatement pst; 
        ResultSet rs;
        Connection conn = connectToBD();
        String query = "SELECT username_user FROM user WHERE connected = TRUE";
        try {
            pst = conn.prepareCall(query);
            pst.clearParameters();
            rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            } else {
                return "";
            }
        } catch (Exception e) {
            System.out.print("Erreur lors de l'enregistrement : " + e);
            return "";
        }
    }

    public boolean isConnected() {
        PreparedStatement pst; 
        ResultSet rs;
        Connection conn = connectToBD();
        String query = "SELECT * FROM user WHERE connected = TRUE";
        try {
            pst = conn.prepareCall(query);
            pst.clearParameters();
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.print("Erreur lors de l'enregistrement : " + e);
            return false;
        }
    }
    %>
                 
                 
        <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster --> 
    <script>window.jQuery || document.write('<script src="JS/jquery-slim.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="../JS/holder.min.js"></script>
    <script src="../JS/popover.js" />
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
    </body>
</html>
