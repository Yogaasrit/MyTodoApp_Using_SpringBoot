package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Todo;
import com.example.demo.repository.TodoRepo;

@Service
public class TodoServiceImplementation implements TodoServiceInterface{
	
	@Autowired
	TodoRepo repo;
	
	@Override
	public List<Todo> getAllTodoItems() {
		ArrayList<Todo> todoList = new ArrayList<>();
		repo.findAll().forEach(todo -> todoList.add(todo));
		return todoList;
	}

	@Override
	public Todo getTodoItemById(int id) {
		return repo.findById(id).get();
	}

	@Override
	public boolean updateStatus(int id) {
		Todo todo = getTodoItemById(id);
		todo.setStatus(true);
		return saveTodoItem(todo);
	}

	@Override
	public boolean saveTodoItem(Todo todo) {
		Todo updatedObj = repo.save(todo);
		if(getTodoItemById(updatedObj.getId()) != null)
				return true;
		return false;
	}

	@Override
	public void deleteTodoItem(int id) {
		repo.deleteById(id);
	}

}
