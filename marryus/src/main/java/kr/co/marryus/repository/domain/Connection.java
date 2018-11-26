package kr.co.marryus.repository.domain;

import java.util.Date;
import lombok.Data;

@Data
public class Connection {
	private String connectionId;
    private String connectionIp;
    private Date connectionTime;
    private String connectionRefer;
    private String connectionAgent;
}
