package kr.co.marryus.repository.mapper;

import kr.co.marryus.repository.domain.Admin;

public interface AdminMapper {

	Admin selectAdmin(Admin admin);
	int signUpAdmin(Admin admin);
}
