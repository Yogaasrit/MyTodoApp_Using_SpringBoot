package com.example.demo.controller;


import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.Todo;
import com.example.demo.service.TodoServiceImplementation;

@Controller
public class TodoController {
	@Autowired
	private TodoServiceImplementation service;
	
	@GetMapping("/")
	public String showTodoItems(Model model) {
		List<Todo> todoList = service.getAllTodoItems();
		model.addAttribute("todoList",todoList);
		return "Todos";
	}
	
	@GetMapping("/addTodo")
	public String showAddTodo() {
		return "addTodo";
	}
	
	@PostMapping("/updateAddTodo")
	public String updateAddTodo(
			@RequestParam("todoName") String todoName,
			@RequestParam("userName") String userName,
			@RequestParam("startDate") Date startDate,
			@RequestParam("endDate") Date endDate,
			Model model){
		Todo todo = new Todo();
		todo.setTodoName(todoName);
		todo.setUserName(userName);
		todo.setStartDate(startDate);
		todo.setEndDate(endDate);
		todo.setStatus(false);
		service.saveTodoItem(todo);
		List<Todo> todoList = service.getAllTodoItems();
		model.addAttribute("todoList",todoList);
		return "Todos";
	}
	
	@GetMapping("/editTodo")
	public String showEditTodo(@RequestParam("id") String id, Model model) {
		Todo todo = service.getTodoItemById(Integer.parseInt(id));
		model.addAttribute("todo",todo);
		return "editTodo";
	}
	
	@PostMapping("/handleUpdateTodo")
    public String updateTodo(@RequestParam("id") Integer id, @RequestParam("todoName") String todoName, 
                             @RequestParam("userName") String userName, @RequestParam("startDate") Date startDate, 
                             @RequestParam("endDate") Date endDate, RedirectAttributes redirectAttributes,
                             Model model){
        Todo todo = service.getTodoItemById(id);
        todo.setTodoName(todoName);
        todo.setUserName(userName);
        todo.setStartDate(startDate);
        todo.setEndDate(endDate);
        service.saveTodoItem(todo);
        redirectAttributes.addFlashAttribute("successMessage", "Todo updated successfully");
        List<Todo> todoList = service.getAllTodoItems();
		model.addAttribute("todoList",todoList);
        return "Todos";
    }
	
	@GetMapping("/deleteTodo")
	public String updateDeleteTodo(@RequestParam("id") Integer id,
			Model model ) {
		service.deleteTodoItem(id);
		List<Todo> todoList = service.getAllTodoItems();
		model.addAttribute("todoList",todoList);
		return "Todos";
	}
	
	@GetMapping("/updateStatus/{id}")
	public String updateCompletionStatus(@PathVariable int id , Model model) {
		service.updateStatus(id);
		List<Todo> todoList = service.getAllTodoItems();
		model.addAttribute("todoList",todoList);
		return "Todos";
	}
}
