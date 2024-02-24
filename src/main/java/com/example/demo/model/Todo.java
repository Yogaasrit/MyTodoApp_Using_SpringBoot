package com.example.demo.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name="todo")
public class Todo {
	@Id
	@GeneratedValue(strategy =GenerationType.AUTO)
	private Integer id;
	@Column
	private String todoName;
	@Column
	private String userName;
	@Column
	private Date startDate;
	@Column
	private Date endDate;
	@Column
	private boolean status;
	
	public Todo() {
		super();
	}

	public Todo(int id, String todoName, String userName, Date startDate, Date endDate, boolean status) {
		super();
		this.id = id;
		this.todoName = todoName;
		this.userName = userName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTodoName() {
		return todoName;
	}

	public void setTodoName(String todoName) {
		this.todoName = todoName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
