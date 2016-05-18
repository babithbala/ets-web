package edu.pwr.ets.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;






import edu.pwr.ets.dto.Acknowledge;
import edu.pwr.ets.dto.ChangePassword;
import edu.pwr.ets.service.UserInfoService;
import edu.pwr.ets.util.ETSUtil;
import edu.pwr.ets.util.SQL;

@Service("userInfoService")
@Scope("session")
public class UserInfoServiceImpl implements UserInfoService {
	
	static Logger logger=Logger.getLogger(UserInfoServiceImpl.class.getName());
	
	public List<Acknowledge> savePassword(ChangePassword data) {
		List<Acknowledge> list = new ArrayList<Acknowledge>();
		Acknowledge acknowledge = new Acknowledge();
		try{
			NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(ETSUtil.getDataSource());
			SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(data);
			template.update(SQL.UPDATE_PASSWORD, namedParameters);
			
			acknowledge.setMessage("User Password updated <br/>");
			list.add(acknowledge);
			}catch(Exception e){
				String cause = e.getCause().toString();
				if(cause !=null){
					acknowledge.setMessage(cause.substring(cause.indexOf(":")+1, cause.length())+"<br/>");
					list.add(acknowledge);
				}
				logger.info(e.getMessage());
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
			return list;
	}
	
	

}
