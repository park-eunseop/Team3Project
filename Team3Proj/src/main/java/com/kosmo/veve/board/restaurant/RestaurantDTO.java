package com.kosmo.veve.board.restaurant;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RestaurantDTO {
	private String res_no;
	private String res_name;
	private String res_addr;
	private String res_tel;
	private String res_menu;
	private String res_coordinate;
	private String category;
	
	
}
