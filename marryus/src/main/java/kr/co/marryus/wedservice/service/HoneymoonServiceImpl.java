package kr.co.marryus.wedservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marryus.repository.mapper.HoneymoonMapper;

@Service
public class HoneymoonServiceImpl implements HoneymoonService{
	@Autowired
	private HoneymoonMapper mapper;
}
