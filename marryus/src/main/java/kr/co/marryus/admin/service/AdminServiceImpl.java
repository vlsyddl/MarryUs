package kr.co.marryus.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Admin;
import kr.co.marryus.repository.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	
	@Override
	public Admin selectAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return mapper.selectAdmin(admin);
	}


	@Override
	public int signUpAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return mapper.signUpAdmin(admin);
	}

}
