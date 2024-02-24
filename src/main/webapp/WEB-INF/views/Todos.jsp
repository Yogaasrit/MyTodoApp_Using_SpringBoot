<%@page import="com.example.demo.model.Todo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo</title>
<style>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    h1 {
        text-align: center;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        border-spacing: 0;
        background-color: #fff;
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #f2f2f2;
    }
    .actions {
        text-align: center;
    }
    .actions a {
        display: inline-block;
        margin: 0 5px;
        padding: 5px 10px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 3px;
    }
    .actions a:hover {
        background-color: #0056b3;
    }
    #addTodoButton {
        display: block;
        width: 200px;
        margin: 20px auto;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        text-align: center;
        border-radius: 5px;
    }
    #addTodoButton:hover {
        background-color: #0056b3;
    }
</style>
</style>
</head>
<body>
<h1>Todo Application</h1>
<%List<Todo> todoList = (List<Todo>)request.getAttribute("todoList");%>
<a href="addTodo" id="addTodoButton">Add Todo</a>
<table>
    <tr>
        <th>ID</th>
        <th>Todo Name</th>
        <th>User Name</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <% for(Todo todo : todoList) { %>
        <tr>
            <td><%= todo.getId() %></td>
            <td><%= todo.getTodoName() %></td>
            <td><%= todo.getUserName() %></td>
            <td><%= todo.getStartDate() %></td>
            <td><%= todo.getEndDate() %></td>
            <td><%= todo.isStatus() ? "Completed" : "Yet to complete" %></td>
            <td class="actions">
                <a href="editTodo?id=<%= todo.getId() %>">Edit</a>
                <a href="deleteTodo?id=<%= todo.getId() %>">Delete</a>
                <a href="updateStatus/<%= todo.getId()%>">Mark as complete</a>
            </td>
        </tr>
    <% } %>
</table>

</body>
</html>
