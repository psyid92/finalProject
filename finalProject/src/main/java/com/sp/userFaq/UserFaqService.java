package com.sp.userFaq;

import java.util.List;
import java.util.Map;

public interface UserFaqService {
    public void insertUserFaq(UserFaq dto)throws Exception;
    public int dataCount(Map<String, Object>map)throws Exception;
    public List<UserFaq> listUserFaq(Map<String, Object>map)throws Exception;
    public int updateCount(int faq_Num)throws Exception;
    public UserFaq readUserFaq(int faq_Num)throws Exception;
    public UserFaq preReadUserFaq(Map<String, Object>map)throws Exception;
    public UserFaq nextReadUserFaq(Map<String, Object>map)throws Exception;
    public void updateUserFaq(UserFaq dto)throws Exception;
    public void deleteUserFaq(int Faq_Num)throws Exception;
}
