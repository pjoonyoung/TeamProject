package com.joonyoung.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDto {
	private int rnum;
	private String rid;
	private String rname;
	private String rphone;
	private String ranimal;
	private String rlist;
	private String rcontent;
	private String rdate;
}
