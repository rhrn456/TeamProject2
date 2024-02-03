package emp.dto; 

import java.sql.Date;

public class Emp {
	private int empno;
	private String ename;
	private String job;
	private Integer mgr;
	private Date hiredate;
	private Float sal;
	private Integer comm;
	private Integer deptno;
	
	public Emp() {}
	public Emp(int empno, String ename, String job, Integer mgr, Date hiredate, Float sal, Integer comm,
			Integer deptno) {
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}
	
	static public class Builder {
		private int empno;
		private String ename;
		private String job;
		private Integer mgr;
		private Date hiredate;
		private Float sal;
		private Integer comm;
		private Integer deptno;
		
		// 기본 생성자
		public Builder() {}
		
		// 사용자 정의 생성자
		public Builder(Emp emp) {
			this.empno = emp.empno;
			this.ename = emp.ename;
			this.job = emp.job;
			this.mgr = emp.mgr;
			this.hiredate = emp.hiredate;
			this.sal = emp.sal;
			this.comm = emp.comm;
			this.deptno = emp.deptno;
		}
		
		// 
		public Builder empno (int empno ) {
			this.empno  = empno ;
			return this;
		}
		public Builder ename(String ename) {
			this.ename = ename;
			return this;
		}
		public Builder job(String job) {
			this.job = job;
			return this;
		}
		public Builder mgr(Integer mgr) {
			this.mgr = mgr;
			return this;
		}
		public Builder hiredate(Date hiredate) {
			this.hiredate = hiredate;
			return this;
		}
		public Builder sal(Float sal) {
			this.sal = sal;
			return this;
		}
		public Builder comm(Integer comm) {
			this.comm = comm;
			return this;
		}
		public Builder deptno(Integer deptno) {
			this.deptno = deptno;
			return this;
		}
		
		public Emp build() {
			return new Emp(empno, ename, job, mgr, hiredate,sal,comm,deptno);
		}
	}
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Integer getMgr() {
		return mgr;
	}
	public void setMgr(Integer mgr) {
		this.mgr = mgr;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public Float getSal() {
		return sal;
	}
	public void setSal(Float sal) {
		this.sal = sal;
	}
	public Integer getComm() {
		return comm;
	}
	public void setComm(Integer comm) {
		this.comm = comm;
	}
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	
	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + "]";
	}
}
