package edu.pwr.ets.service;

import java.util.List;

import edu.pwr.ets.dto.Acknowledge;
import edu.pwr.ets.dto.ChangePassword;


public interface UserInfoService {
	
	public abstract List<Acknowledge> savePassword(ChangePassword data);

}
