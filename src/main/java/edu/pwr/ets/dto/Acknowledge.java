package edu.pwr.ets.dto;

public class Acknowledge {
	
	private Long id;
	private Long idNext;
	private String name;
	private String message;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Long getIdNext() {
		return idNext;
	}
	public void setIdNext(Long idNext) {
		this.idNext = idNext;
	}
	
	
	
	

}
