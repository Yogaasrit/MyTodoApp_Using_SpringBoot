<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Todo</title>
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
    .container {
        width: 50%;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    input[type="text"], input[type="date"] {
        width: calc(100% - 12px);
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .error-message {
        color: red;
    }
</style>
</head>
<body>
<h1>Add Todo</h1>
<div class="container">
    <form action="updateAddTodo" method="post">
        <div class="form-group">
            <label for="todoName">Todo Name:</label>
            <input type="text" id="todoName" name="todoName" required>
        </div>
        <div class="form-group">
            <label for="userName">User Name:</label>
            <input type="text" id="userName" name="userName" required>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" min="<%= java.time.LocalDate.now() %>" required>
            <span class="error-message" id="startDateError"></span>
        </div>
        <div class="form-group">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" min="<%= java.time.LocalDate.now() %>" required>
            <span class="error-message" id="endDateError"></span>
        </div>
        <input type="submit" value="Add">
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var startDateInput = document.getElementById('startDate');
        var endDateInput = document.getElementById('endDate');
        
        startDateInput.addEventListener('change', function() {
            var startDate = new Date(this.value);
            var endDate = new Date(endDateInput.value);
            var today = new Date();
            
            if (startDate < today) {
                document.getElementById('startDateError').textContent = 'Start date should be today or future date.';
            } else if (endDate < startDate) {
                document.getElementById('endDateError').textContent = 'End date should be today or future date and greater than start date.';
            } else {
                document.getElementById('startDateError').textContent = '';
                document.getElementById('endDateError').textContent = '';
            }
        });
        
        endDateInput.addEventListener('change', function() {
            var endDate = new Date(this.value);
            var startDate = new Date(startDateInput.value);
            var today = new Date();
            
            if (endDate < today) {
                document.getElementById('endDateError').textContent = 'End date should be today or future date.';
            } else if (endDate < startDate) {
                document.getElementById('endDateError').textContent = 'End date should be today or future date and greater than start date.';
            } else {
                document.getElementById('endDateError').textContent = '';
            }
        });
    });
</script>

</body>
</html>
