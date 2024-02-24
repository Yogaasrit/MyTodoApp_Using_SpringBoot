package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Todo;

public interface TodoServiceInterface {
	public List<Todo> getAllTodoItems();
	public Todo getTodoItemById(int id);
	public boolean updateStatus(int id);
	public boolean saveTodoItem(Todo todo);
	public void deleteTodoItem(int id);
}
