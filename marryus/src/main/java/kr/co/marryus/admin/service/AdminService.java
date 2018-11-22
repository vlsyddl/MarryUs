package kr.co.marryus.admin.service;

import kr.co.marryus.repository.domain.Admin;

public interface AdminService {
	Admin selectAdmin(Admin admin);
	int signUpAdmin(Admin admin);
}
