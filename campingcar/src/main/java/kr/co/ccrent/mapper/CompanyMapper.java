package kr.co.ccrent.mapper;

import java.util.List;

import kr.co.ccrent.dto.CompanyDTO;
import kr.co.ccrent.dto.Criteria;




public interface CompanyMapper {
	List<CompanyDTO> selectAll(Criteria cri)throws Exception;
	public int selectAll_Count(Criteria cri) throws Exception;
	
	List<CompanyDTO> getAll2();
	
	List<CompanyDTO> getAll3();
	
	CompanyDTO get(int comp_id);
	
	int register(CompanyDTO companyDTO);

	int stsmodify(CompanyDTO companyDTO);
	
	int stsmodify2(int comp_status);
	




	
}
