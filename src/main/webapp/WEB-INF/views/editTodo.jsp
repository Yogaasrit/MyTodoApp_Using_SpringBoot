<%@page import="com.example.demo.model.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Todo</title>
</head>
<body>
<%Todo todo = (Todo)request.getAttribute("todo"); %>
<form action="handleUpdateTodo" method="post">
    <input type="hidden" name="id" value="<%= todo.getId() %>">
    <label for="todoName">Todo Name:</label>
    <input type="text" id="todoName" name="todoName" value="<%= todo.getTodoName() %>"><br>
    
    <label for="userName">User Name:</label>
    <input type="text" id="userName" name="userName" value="<%= todo.getUserName() %>"><br>
    
    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate" value="<%= todo.getStartDate() %>"><br>
    
    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate" value="<%= todo.getEndDate() %>"><br>
    
    <input type="submit" value="Update">
</form>
</body>
</html>
