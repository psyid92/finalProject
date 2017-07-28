<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

  <div class="adminBodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 환불 </h3>
    </div>
    
    <div class="table-responsive" style="clear: both;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                         	환불 신청
                         </th>
                     </tr>
                <thead>
                
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                                                                     아이디 : ${dto.m1_Email}
                         </td>
                         <td style="text-align: right;">
                          ${dto.refund_Created }
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 230px;">
                             ${dto.refund_Memo}
                         </td>
                     </tr>
                      
                     <tr>
                		<td>
                			<c:if test="${dto.refund_State == 0}">
	                			<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/admin/refund_ok?jumun_Num=${jumun_Num}'">환불완료</button>
	                		</c:if>
	                		<c:if test="${dto.refund_State == 1}">
								<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/admin/refund'">환불취소</button>
							</c:if>
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/admin/refund';"> 목록으로 </button>
                		</td>
                	</tr>
              
                </tbody>
            </table>
       </div>

   </div>

  </div>
