package kr.co.marryus.repository.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import kr.co.marryus.repository.domain.Admin;

public interface AdminMapper {

	Admin selectAdmin(Admin admin);
	int signUpAdmin(Admin admin);
	List countConnection();
}
