package kr.co.marryus.connection.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.domain.Connection;
import kr.co.marryus.repository.mapper.ConnectionMapper;

@Service
public class ConnectionServiceImpl implements ConnectionService{

	@Autowired
	private ConnectionMapper mapper;
	
	@Override
	public Connection checkConnection(Connection connection) {
		// TODO Auto-generated method stub
		return mapper.checkConnection(connection);
	}

}
