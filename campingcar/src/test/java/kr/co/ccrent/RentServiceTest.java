package kr.co.ccrent;

import java.util.HashMap;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.service.RentService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RentServiceTest {

	@Autowired
	private RentService rentService;
	
	@Test
	public void getDateRedundancyTest() {
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", 1);
		varmap.put("rent_startdate", "2023-02-01");
		varmap.put("rent_enddate", "2023-02-10");
		RentDTO rentDTO = rentService.getDateRedundancy(varmap);
		System.out.println(rentDTO);
	}
	
}
