package com.sp.giupQna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("giupQna.qnaService")
public class QnaserviceImpl implements QnaService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;	
	
	@Override
	public int insertQna(Qna dto, String mode, String pathname) {
		int result= 0;
		
		try {
			if(mode.equals("created")) {
				int maxNum=dao.getIntValue("giupQna.maxNum"); 
				dto.setQ_Num(maxNum+1);
				dto.setQ_GroupNum(dto.getQ_Num());
				
				if(dto.getUpload() !=null && !dto.getUpload().isEmpty()) { // 업로드할 파일이 있을 경우
					String saveFileName = fileManager.doFileUpload(dto.getUpload(), pathname);
					dto.setQ_SaveFileName(saveFileName);
					dto.setQ_OriginalFileName(dto.getUpload().getOriginalFilename());
				}
			} else if(mode.equals("reply")) {
				// orderNo 변경
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("q_GroupNum", dto.getQ_GroupNum());
				map.put("q_OrderNo", dto.getQ_OrderNo());
				dao.updateData("giupQna.updateOrderNo", map);
				
				int maxNum=dao.getIntValue("giupQna.maxNum");
				dto.setQ_Num(maxNum+1);
				dto.setQ_Depth(dto.getQ_Depth() +1);
				dto.setQ_OrderNo(dto.getQ_OrderNo()+1);
			}
			
			result=dao.insertData("giupQna.insertQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("giupQna.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Qna> ListQna(Map<String, Object> map) {
		List<Qna> list = null;
		try {
			list = dao.getListData("giupQna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Qna readQna(int q_Num) {
		Qna dto = null;
		try {
			dto = dao.getReadData("giupQna.readQna", q_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int q_Num) {
		int result = 0;
		try {
			result = dao.updateData("giupQna.updateHitCount", q_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Qna preReadQna(Map<String, Object> map) {
		Qna dto = null; 
		try {
			dto = dao.getReadData("giupQna.preReadQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Qna nextReadQna(Map<String, Object> map) {
		Qna dto = null; 
		try {
			dto = dao.getReadData("giupQna.nextReadQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateQna(Qna dto, String pathname) {
		int result=0; 
		try {
			// 이전파일 지우기
			if(dto.getQ_SaveFileName().length() !=0)
				fileManager.doFileDelete(dto.getQ_SaveFileName(), pathname);
			
			String saveFileName=fileManager.doFileUpload(dto.getUpload(), pathname);
			if (saveFileName !=null) {
				dto.setQ_OriginalFileName(dto.getUpload().getOriginalFilename());
				dto.setQ_SaveFileName(saveFileName);
			}
			
			dao.updateData("giupQna.updateQna", dto);
			result =1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteQna(int q_Num, String q_SaveFileName, String pathname) {
		int result = 0;
		try {
			if(q_SaveFileName != null) 
				fileManager.doFileDelete(q_SaveFileName, pathname);
			
			dao.deleteData("giupQna.deleteQna", q_Num);
			result = 1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
