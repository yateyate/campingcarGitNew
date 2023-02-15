package kr.co.ccrent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccrent.domain.QnaVO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.QnaDTO;
//import kr.co.ccrent.dto.SearchCriteria;
import kr.co.ccrent.mapper.QnaMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;

	@Override
	public void regist(QnaVO qna) throws Exception {

		log.info("register.........." + qna);

		mapper.create(qna);
	}

	@Override
	public QnaVO read(Integer qna_no) throws Exception {

		log.info("read.........." + qna_no);

		return mapper.read(qna_no);
	}

	@Override
	public int modify(QnaVO qna) throws Exception {

		log.info("modify.........." + qna);

		return mapper.update(qna);
	}

	@Override
	public int remove(Integer qna_no) throws Exception {

		log.info("remove.........." + qna_no);

		return mapper.delete(qna_no);
	}

	@Override
	public int getTotal() {

		return mapper.getTotal();
	}

	@Override
	public List<QnaDTO> getAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectAll(cri);
	}

	@Override
	public int getAll_Count(Criteria cri) throws Exception {

		return mapper.selectAll_Count(cri);
	}


}
