package cn.edu.nyist.domain;

import org.apache.ibatis.annotations.Param;

import javax.validation.constraints.Pattern;

public class Emp {
    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{3,10}$)|(^[\\u2E80-\\u9FFF]{2,5})")
    private String empName;

    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$")
    private String email;

    private String gender;

    private Integer deptno;

    public Emp() {
        super();
    }

    public Emp(Integer empId, String empName, String email, String gender, Integer deptno) {
        this.empId = empId;
        this.empName = empName;
        this.email = email;
        this.gender = gender;
        this.deptno = deptno;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getDeptno() {
        return deptno;
    }

    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", deptno=" + deptno +
                '}';
    }
}