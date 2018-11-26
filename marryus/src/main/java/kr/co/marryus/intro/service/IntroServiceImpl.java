package kr.co.marryus.intro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Connection;
import kr.co.marryus.repository.mapper.IntroMapper;

@Service
public class IntroServiceImpl implements IntroService{
	
	@Autowired
	private IntroMapper mapper;
	
	@Override
	public int checkConnection(Connection connection) {
		// TODO Auto-generated method stub
		return mapper.checkConnection(connection);
	}

}
