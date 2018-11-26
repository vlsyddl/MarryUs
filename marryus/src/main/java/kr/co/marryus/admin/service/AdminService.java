package kr.co.marryus.admin.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import kr.co.marryus.repository.domain.Admin;

public interface AdminService {
	Admin selectAdmin(Admin admin);
	int signUpAdmin(Admin admin);
	List countConnection();
}
