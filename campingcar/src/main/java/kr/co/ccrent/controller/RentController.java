package kr.co.ccrent.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ccrent.config.DateProcess;
import kr.co.ccrent.dto.CarDTO;
import kr.co.ccrent.dto.RentDTO;
import kr.co.ccrent.service.CarService;
import kr.co.ccrent.service.RentService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/rent")
@RequiredArgsConstructor
public class RentController {

	private final RentService rentService;
	private final CarService carService;
	private final DateProcess dateProcess; 
	
	@GetMapping("/list")
	public void listGET(String curYear, String curMon, Model model) {
		System.out.println("<Controller> rent list GET");
		HashMap<String, Object> datemap = dateProcess.dateCalculate(curYear, curMon, 0); // ���� ��, �� ���� ��¥ ���	
		HashMap<Integer, Object> maplist = new HashMap<>(); // ���� ����Ʈ ��
		HashMap<String, Object> varmap = new HashMap<>(); // �Ű����� �� 
		List<CarDTO> carlist = carService.getAll(); // ���� ��� �ҷ�����
		System.out.println(datemap.get("firstday"));
		System.out.println(datemap.get("lastday"));
		for(int i=0; i<carlist.size(); i++) {
			varmap.clear();
			varmap.put("car_regid", carlist.get(i).getCar_regid());
			System.out.println("����ȣ : "+carlist.get(i).getCar_regid());
			varmap.put("firstday", datemap.get("firstday"));
			varmap.put("lastday", datemap.get("lastday"));	
			varmap.put("dummy", "1");				
			maplist.put(carlist.get(i).getCar_regid(), rentService.getByCarId(varmap));
		}
		model.addAttribute("maplist", maplist);
		model.addAttribute("carlist", carService.getAll());
	}
	
	@GetMapping("/register")
	public void registerGET(Model model, int car_regid) {
		System.out.println("<Controller> rent register GET");
		System.out.println("car_regid : "+car_regid);
		model.addAttribute("carlist", carService.getAll());
		model.addAttribute("car", carService.getOne(car_regid));
		HashMap<String, Object> datemap = dateProcess.dateCalculate(null, null, 1);
		HashMap<String, Object> varmap = new HashMap<>();
		varmap.put("car_regid", car_regid);
		varmap.put("firstday", datemap.get("firstday"));
		varmap.put("lastday", datemap.get("lastday"));
		varmap.put("dummy", "1");	
		HashMap<String, RentDTO> map = rentService.getByCarId(varmap);
		model.addAttribute("rentlist", map);
	}
	@PostMapping("/register")
	public String registerPOST(RentDTO rentDTO) {
		System.out.println("<Controller> rent register POST");
		System.out.println(rentDTO);
		rentService.register(rentDTO);
		return "redirect:/rent/list";
	}
	@GetMapping("/read")
	public void readGET() {
		System.out.println("<Rent Controller> read GET");
	}
	@GetMapping("/template")
	public void templateGET() {
		
	}
}
