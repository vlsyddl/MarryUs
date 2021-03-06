package kr.co.marryus.repository.domain;

import java.util.Date;

import lombok.Data;



@Data
public class Item {
	private String title;  
	private String description;
	private String dueDate;
	
	
	private boolean done;
	private String listId;
	
	private String todoNo;
	
	
	private int todoDday;
	private String todoCheck;
	private String todoDelete;
	private Todo todo;
	

	public void setDone() {
		if(this.todoCheck=="Y"||this.todoCheck=="y") {
			this.done =true;
		}else if(this.todoCheck=="N"||this.todoCheck=="n") {
			this.done =false;
		}	
	}
	public boolean getDone() {
		return done;
	}

	
	public Todo getTodo() {
		Todo todo = new Todo();

		if(!this.title.isEmpty()) {
			todo.setTodoTitle(this.title);
		}
		if(!this.description.isEmpty()) {
			todo.setTodoDetail(this.description);
		}
       if(this.dueDate != null) {
			todo.setTodoDay(this.dueDate);
		}
	
		if(done==true) {
			todo.setTodoCheck("Y");
		}else if(done==false) {
			todo.setTodoCheck("N");
		}	
		

		if(!this.todoNo.isEmpty()) {
			todo.setTodoNo(Integer.parseInt(this.todoNo));
		}
		
		
		if(!this.listId.isEmpty()) {
			todo.setTodoCategory(this.listId.substring(14));
		}

		return todo;
	}





	@Override
	public String toString() {
		return "Item [title=" + title + ", description=" + description + ", dueDate=" + dueDate + ", done=" + done
				+ ", listId=" + listId + ", todoNo=" + todoNo + ", todoDday=" + todoDday + ", todoCheck=" + todoCheck
				+ ", todoDelete=" + todoDelete + ", todo=" + todo + ", getTodo()=" + getTodo() +"]";
	}
	
	
	
	
}



