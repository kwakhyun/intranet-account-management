package kr.co.vo;

import java.util.Date;

public class MemberVO {
	
	private String dealer_no;
	private String user_group_id;
	private String sha_passwd;
	private String dealer_name;
	private String home_tel_no;
	private String my_cti_manager_id;
	private String start_date;
	private String end_date;
	private String email;
	private String group_part;
	private String work_group;
	private String login_able;
	private String leave_date;
	private Date leave_update_date;
	
	private String admin_id;
	private String admin_pw;


	public String getDealer_no() {
		return dealer_no;
	}
	public void setDealer_no(String dealer_no) {
		this.dealer_no = dealer_no;
	}
	public void setUser_group_id(String user_group_id) {
		this.user_group_id = user_group_id;
	}
	public String getDealer_name() {
		return dealer_name;
	}
	public String getUser_group_id() {
		return user_group_id;
	}
	public String getSha_passwd() {
		return sha_passwd;
	}
	public void setSha_passwd(String sha_passwd) {
		this.sha_passwd = sha_passwd;
	}
	public void setDealer_name(String dealer_name) {
		this.dealer_name = dealer_name;
	}
	public String getHome_tel_no() {
		return home_tel_no;
	}
	public void setHome_tel_no(String home_tel_no) {
		this.home_tel_no = home_tel_no;
	}
	public String getMy_cti_manager_id() {
		return my_cti_manager_id;
	}
	public void setMy_cti_manager_id(String my_cti_manager_id) {
		this.my_cti_manager_id = my_cti_manager_id;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGroup_part() {
		return group_part;
	}
	public void setGroup_part(String group_part) {
		this.group_part = group_part;
	}
	public String getWork_group() {
		return work_group;
	}
	public void setWork_group(String work_group) {
		this.work_group = work_group;
	}
	public String getLogin_able() {
		return login_able;
	}
	public void setLogin_able(String login_able) {
		this.login_able = login_able;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	public Date getLeave_update_date() {
		return leave_update_date;
	}
	public void setLeave_update_date(Date leave_update_date) {
		this.leave_update_date = leave_update_date;
	}

	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	
}
