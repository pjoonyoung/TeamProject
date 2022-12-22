package com.joonyoung.home.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
	private String mid;//아이디
	private String mpw;//비밀번호
	private String mname;//이름
	private String mgender;//성별
	private String mphone;//연락처
	private String memail;//이메일
	private String mdate;//가입일시
}
