package com.sp.giupNotice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("giupNotice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;	
	
	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result=0;
		try {
			int maxNum=dao.getIntValue("giupNotice.maxNum");
			dto.setNoti_Num(maxNum+1);
			
			result =dao.insertData("giupNotice.insertNotice", dto);
			
			//파일업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if(saveFileName !=null) {
						String originalFileName=mf.getOriginalFilename();
						long fileSize=mf.getSize();
						
						dto.setNoti_OrigianlFileName(originalFileName);
						dto.setNoti_SaveFileName(saveFileName);
						dto.setNoti_FileSize(fileSize);
						
						insertFile(dto);
					}					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result = dao.getIntValue("giupNotice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list=dao.getListData("giupNotice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null; 
		try {
			list=dao.getListData("giupNotice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updateHit(int num) {
		int result =0;
		try {
			result=dao.updateData("giupNotice.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Notice readNotice(int num) {
		Notice dto = null;
		try {
			dto=dao.getReadData("giupNotice.readNotice",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null; 
		try {
			dto=dao.getReadData("giupNotice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto=dao.getReadData("giupNotice.nextReadNotice", map); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result =0;
		try {
			result=dao.updateData("giupNotice.updateNotice", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					String saveFileName=fileManager.doFileUpload(mf, pathname);
					if(saveFileName!=null) {
						String originalFileName=mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setNoti_SaveFileName(saveFileName);
						dto.setNoti_OrigianlFileName(originalFileName);
						dto.setNoti_FileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteNotice(int num, String pathname) {
		int result =0; 
		
		try {
			// 파일 지우기
			List<Notice> listFile = listFile(num);
			if(listFile !=null) {
				Iterator<Notice> it=listFile.iterator();
				while(it.hasNext()) {
					Notice dto=it.next();
					fileManager.doFileDelete(dto.getNoti_SaveFileName(), pathname);
				}
			}
			
			// 파일 테이블 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			result = dao.deleteData("giupNotice.deleteNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertFile(Notice dto) {
		int result=0;
		try {
			result=dao.insertData("giupNotice.insertFile", dto); // mapper의 namespace(giupNotice) 및 각  id(insertFile)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Notice> listFile(int num) {
		List<Notice> listFile=null;
		
		try {
			listFile=dao.getListData("giupNotice.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Notice readFile(int filenum) {
		Notice dto=null;
		
		try {
			dto=dao.getReadData("giupNotice.readFile", filenum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("giupNotice.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
